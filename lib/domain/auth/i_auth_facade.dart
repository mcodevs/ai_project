import 'dart:math';

import 'package:ai_project/infrastructure/failure/failure.dart';

abstract class IAuthFacade {
  bool isLogged();
  Future<Status<Failure, bool>> login();
}

class Repo implements IAuthFacade {
  @override
  bool isLogged() {
    throw UnimplementedError();
  }

  @override
  Future<Status<Failure, bool>> login() async {
    await Future.delayed(const Duration(seconds: 4));
    if (Random().nextBool()) {
      return Good(const Failure.unknown("Unknown Error"));
    } else {
      return Bad(true);
    }
  }
}

abstract class Status<R, L> with _StatusPatternMatcher<R, L> {}

class Good<G, B> extends Status<G, B> {
  Good(this.value);
  G value;

  @override
  S fold<S>(S Function(B b) b, S Function(G g) g) => g(this.value);
}

class Bad<G, B> extends Status<G, B> {
  Bad(this.value);
  B value;

  @override
  S fold<S>(S Function(B b) b, S Function(G g) g) => b(this.value);
}

mixin _StatusPatternMatcher<G, B> {
  S fold<S>(S Function(B b) b, S Function(G g) g);
}
