import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moim_app/design_system.dart';
import 'package:moim_app/screens/intro/login/login_screen.dart';
import 'package:moim_app/screens/intro/sign_up/sign_up_background.dart';

import '../../../components/buttons.dart';
import '../../../components/rounded_input_field.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SignUpBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                'SIGN UP',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: SvgPicture.asset(
                'assets/icons/signup.svg',
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
              text: 'SIGN UP',
              onPress: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Already have an account? ',
                  style: TextStyle(color: primaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          }
                      ),
                    );
                  },
                  child: const Text(
                    'Login',
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
