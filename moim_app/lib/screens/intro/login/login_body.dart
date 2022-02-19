import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moim_app/design_system.dart';
import 'package:moim_app/screens/intro/login/login_background.dart';
import 'package:moim_app/screens/intro/sign_up/sign_up_screen.dart';

import '../../../components/buttons.dart';
import '../../../components/rounded_input_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: LoginBackground(
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
            SizedBox(
              height: size.height * 0.03,
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: SvgPicture.asset(
                'assets/icons/login.svg',
                height: size.height * 0.35,
              ),
            ),
            RoundedInputField(
              onChanged: (value) {},
              hintText: 'Your Email Address',
              icon: Icons.person,
            ),
            RoundedInputField(
              onChanged: (value) {},
              hintText: 'Password',
              icon: Icons.lock,
              type: RoundedInputFieldType.password,
            ),
            RoundedButton(
              text: 'LOGIN',
              onPress: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Do not have an account? ',
                  style: TextStyle(color: primaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return const SignUpScreen();
                          }
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
