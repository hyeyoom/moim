import 'package:flutter/material.dart';
import 'package:moim_app/screens/intro/sign_up/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: Container(
            color: Colors.white,
            child: const SignUpBody(),
          ),
        ),
    );
  }
}
