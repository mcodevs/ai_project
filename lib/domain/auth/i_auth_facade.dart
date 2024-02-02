abstract class IAuthFacade {
  bool isLogged();
}

abstract class Status<T> {
  T fold();
}

class Good extends Status {
  @override
  fold() {
    // TODO: implement fold
    throw UnimplementedError();
  }
}

class Bad extends Status {
  @override
  fold() {
    // TODO: implement fold
    throw UnimplementedError();
  }
}
