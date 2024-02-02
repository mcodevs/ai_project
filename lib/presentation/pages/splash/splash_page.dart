import 'package:ai_project/application/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final ValueNotifier<String> version = ValueNotifier("");

  @override
  void initState() {
    _getVersion();
    context.read<AuthBloc>().checkAuth();
    super.initState();
  }

  Future<void> _getVersion() async {
    PackageInfo.fromPlatform().then(
      (value) {
        version.value = value.version;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLogged == true) {
          // TODO: getHomePage;
        } else if (state.isLogged == false) {
          // TODO: getLoginPage;
        }
      },
      child: Scaffold(
        floatingActionButton: Column(
          children: [
            const Text("App name"),
            ValueListenableBuilder(
              valueListenable: version,
              builder: (context, ver, _) {
                return Text(ver);
              },
            ),
          ],
        ),
        body: const Center(
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
