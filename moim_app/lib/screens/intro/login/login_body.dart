import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moim_app/components/buttons.dart';
import 'package:moim_app/components/rounded_input_field.dart';
import 'package:moim_app/core/constants/design_system.dart';
import 'package:moim_app/core/router/router_consts.dart';
import 'package:moim_app/core/router/router_page_action.dart';
import 'package:moim_app/core/router/router_page_state.dart';
import 'package:moim_app/screens/intro/login/login_background.dart';
import 'package:moim_app/service/mock_user_service.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_state.dart';

class LoginBody extends StatelessWidget {
  final MockUserService mockUserService = MockUserService();

  LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppState appState = Provider.of<AppState>(context, listen: false);

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
              onPress: () {
                mockUserService.auth();
                appState.currentAction = PageAction(state: PageState.REPLACE_ALL, page: mainPageConfig);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Do not have an account? ',
                  style: TextStyle(color: primaryColor),
                ),
                GestureDetector(
                  onTap: () => appState.currentAction =
                      PageAction(state: PageState.REPLACE, page: signUpPageConfig),
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
