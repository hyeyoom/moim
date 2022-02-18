import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moim_app/design_system.dart';
import 'package:moim_app/screens/sign_up/sign_up_screen.dart';

import 'welcome_background.dart';
import '../../components/buttons.dart';
import '../login/login_screen.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WelcomeBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              'Greeting from Moim',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: size.height * 0.03,),
          Align(
            alignment: AlignmentDirectional.center,
            child: SvgPicture.asset(
              'assets/icons/chat.svg',
              height: size.height * 0.45,
            ),
          ),
          SizedBox(height: size.height * 0.03,),
          Align(
            alignment: AlignmentDirectional.center,
            child: RoundedButton(
              text: 'LOGIN',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    }
                  ),
                );
              },
              color: primaryColor,
              textColor: Colors.white,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: RoundedButton(
              text: 'SIGN UP',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return const SignUpScreen();
                      }
                  ),
                );
              },
              color: primaryWeakColor,
              textColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
