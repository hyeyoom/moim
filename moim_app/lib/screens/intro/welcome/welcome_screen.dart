import 'package:flutter/material.dart';
import 'package:moim_app/screens/intro/welcome/weclome_body.dart';

class WelcomeScreen extends StatelessWidget {
  static const String route = '/welcome';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeBody(),
    );
  }
}
