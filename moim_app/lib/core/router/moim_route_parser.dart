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
      return welcomePageConfig;
    }

    final path = '/' + uri.pathSegments[0];
    switch (path) {
      case welcomePath:
        return welcomePageConfig;
      case loginPath:
        return loginPageConfig;
      case signUpPath:
        return signUpPageConfig;
      case myPagePath:
        return myPageConfig;
      case mainPath:
        return mainPageConfig;
      default:
        return welcomePageConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
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
      default: return const RouteInformation(location: welcomePath);

    }
  }
}