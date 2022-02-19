import 'package:flutter/material.dart';
import 'package:moim_app/screens/intro/login/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: const LoginBody(),
        ),
      ),
    );
  }
}
