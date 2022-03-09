import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moim_app/components/buttons.dart';
import 'package:moim_app/core/constants/design_system.dart';
import 'package:moim_app/core/router/router_consts.dart';
import 'package:moim_app/core/router/router_page_action.dart';
import 'package:moim_app/core/router/router_page_state.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_state.dart';
import 'welcome_background.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final appState = Provider.of<AppState>(context, listen: false);
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
          SizedBox(
            height: size.height * 0.03,
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: SvgPicture.asset(
              'assets/icons/chat.svg',
              height: size.height * 0.45,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: RoundedButton(
              text: 'LOGIN',
              onPress: () => appState.currentAction =
                    PageAction(state: PageState.ADD_PAGE, page: loginPageConfig),
              color: primaryColor,
              textColor: Colors.white,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: RoundedButton(
              text: 'SIGN UP',
              onPress: () => appState.currentAction =
                  PageAction(state: PageState.ADD_PAGE, page: signUpPageConfig),
              color: primaryWeakColor,
              textColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
