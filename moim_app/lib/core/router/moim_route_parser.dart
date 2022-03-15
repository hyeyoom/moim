import 'package:flutter/cupertino.dart';
import 'package:moim_app/core/router/router_consts.dart';
import 'package:moim_app/core/router/router_page_configuration.dart';
import 'package:moim_app/core/router/router_pages.dart';

class MoimRouteParser extends RouteInformationParser<PageConfiguration> {

  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if(uri.pathSegments.isEmpty) {
      return splashScreenConfig;
    }

    final path = '/' + uri.pathSegments[0];
    switch (path) {
      case splashPath:
        return splashScreenConfig;
      case welcomePath:
        return welcomeScreenConfig;
      case loginPath:
        return loginScreenConfig;
      case signUpPath:
        return signUpScreenConfig;
      case myPagePath:
        return myPageScreenConfig;
      case mainPath:
        return mainScreenConfig;
      default:
        return splashScreenConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.SPLASH:
        return const RouteInformation(location: splashPath);
      case Pages.WELCOME:
        return const RouteInformation(location: welcomePath);
      case Pages.LOGIN:
        return const RouteInformation(location: loginPath);
      case Pages.SIGN_UP:
        return const RouteInformation(location: signUpPath);
      case Pages.MY_PAGE:
        return const RouteInformation(location: myPagePath);
      case Pages.MAIN:
        return const RouteInformation(location: mainPath);
      default:
        return const RouteInformation(location: splashPath);
    }
  }
}
