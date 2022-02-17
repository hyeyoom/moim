import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moim_app/design_system.dart';
import 'package:moim_app/screens/login/login_background.dart';

import '../../components/buttons.dart';
import '../login/login_screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              'LOGIN',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: size.height * 0.03,),
          Align(
            alignment: AlignmentDirectional.center,
            child: SvgPicture.asset(
              'assets/icons/login.svg',
              height: size.height * 0.35,
            ),
          ),
        ],
      ),
    );
  }
}
