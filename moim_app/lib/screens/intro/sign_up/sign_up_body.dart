import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moim_app/components/buttons.dart';
import 'package:moim_app/components/rounded_input_field.dart';
import 'package:moim_app/core/constants/design_system.dart';
import 'package:moim_app/core/router/router_consts.dart';
import 'package:moim_app/core/router/router_page_action.dart';
import 'package:moim_app/core/router/router_page_state.dart';
import 'package:moim_app/screens/intro/sign_up/sign_up_background.dart';
import 'package:moim_app/service/mock_user_service.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_state.dart';

class SignUpBody extends StatelessWidget {
  MockUserService mockUserService = MockUserService();

  SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppState appState = Provider.of<AppState>(context, listen: false);

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
              onPress: () {
                debugPrint('request sign up');
                mockUserService.join();
                PageAction(state: PageState.POP);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Already have an account? ',
                  style: TextStyle(color: primaryColor),
                ),
                GestureDetector(
                  onTap: () => appState.currentAction =
                      PageAction(state: PageState.REPLACE, page: loginPageConfig),
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
