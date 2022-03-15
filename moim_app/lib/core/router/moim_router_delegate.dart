import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moim_app/core/router/app_state.dart';
import 'package:moim_app/core/router/router_consts.dart';
import 'package:moim_app/core/router/router_page_action.dart';
import 'package:moim_app/core/router/router_page_configuration.dart';
import 'package:moim_app/core/router/router_page_state.dart';
import 'package:moim_app/core/router/router_pages.dart';
import 'package:moim_app/screens/intro/login/login.dart';
import 'package:moim_app/screens/intro/sign_up/sign_up_screen.dart';
import 'package:moim_app/screens/intro/splash/splash_screen.dart';
import 'package:moim_app/screens/intro/welcome/welcome_screen.dart';
import 'package:moim_app/screens/main/main_screen.dart';
import 'package:moim_app/screens/main/mypage/my_page_screen.dart';

import 'moim_back_button_dispatcher.dart';

class MoimRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {

  final List<Page> _pages = [];
  MoimBackButtonDispatcher? myBackButtonDispatcher;

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AppState appState;

  MoimRouterDelegate(this.appState) : navigatorKey = GlobalKey() {
    appState.addListener(() {
      notifyListeners();
    });
  }

  List<MaterialPage> get pages => List.unmodifiable(_pages);

  int numPages() => _pages.length;

  @override
  PageConfiguration get currentConfiguration {
    return _pages.last.arguments as PageConfiguration;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: buildPages(),
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if(canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  void _removePage(MaterialPage? page) {
    if(page != null) {
      _pages.remove(page);
    }
  }

  void pop() {
    if (canPop()) {
      _removePage(pages.last);
    }
  }

  bool canPop() {
    return _pages.length > 1;
  }

  @override
  Future<bool> popRoute() {
    if(canPop()) {
      _removePage(pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }


  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
      child: child,
      key: ValueKey(pageConfig.key),
      name: pageConfig.path,
      arguments: pageConfig
    );
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  void addPage(PageConfiguration pageConfig) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            pageConfig.uiPage;
    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
        case Pages.SPLASH:
          _addPageData(SplashScreen(), splashScreenConfig);
          break;
        case Pages.WELCOME:
          _addPageData(WelcomeScreen(), welcomeScreenConfig);
          break;
        case Pages.LOGIN:
          _addPageData(LoginScreen(), loginScreenConfig);
          break;
        case Pages.SIGN_UP:
          _addPageData(SignUpScreen(), signUpScreenConfig);
          break;
        case Pages.MAIN:
          _addPageData(MainScreen(), mainScreenConfig);
          break;
        case Pages.MY_PAGE:
          _addPageData(MyPageScreen(), myPageScreenConfig);
          break;
        default:
          break;
      }
    }
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
  }

  void replaceAll(PageConfiguration newRoute) {
    setNewRoutePath(newRoute);
  }

  void push(PageConfiguration newRoute) {
    addPage(newRoute);
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
  }

  void addAll(List<PageConfiguration> routes) {
    _pages.clear();
    routes.forEach((route) {
      addPage(route);
    });
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            configuration.uiPage;
    if (shouldAddPage) {
      _pages.clear();
      addPage(configuration);
    }
    return SynchronousFuture(null);
  }

  void _setPageAction(PageAction action) {
    switch (action.page!.uiPage) {
      case Pages.SPLASH:
        splashScreenConfig.currentPageAction = action;
        break;
      case Pages.WELCOME:
        welcomeScreenConfig.currentPageAction = action;
        break;
      case Pages.LOGIN:
        loginScreenConfig.currentPageAction = action;
        break;
      case Pages.SIGN_UP:
        signUpScreenConfig.currentPageAction = action;
        break;
      case Pages.MAIN:
        mainScreenConfig.currentPageAction = action;
        break;
      case Pages.MY_PAGE:
        mainScreenConfig.currentPageAction = action;
        break;
      default:
        break;
    }
  }

  List<Page> buildPages() {
    if (!appState.initFinished) {
      replaceAll(splashScreenConfig);
    } else {
      switch (appState.currentAction.state) {
        case PageState.NONE:
          break;
        case PageState.ADD_PAGE:
          _setPageAction(appState.currentAction);
          addPage(appState.currentAction.page!);
          break;
        case PageState.POP:
          pop();
          break;
        case PageState.REPLACE:
          _setPageAction(appState.currentAction);
          replace(appState.currentAction.page!);
          break;
        case PageState.REPLACE_ALL:
          _setPageAction(appState.currentAction);
          replaceAll(appState.currentAction.page!);
          break;
        case PageState.ADD_WIDGET:
          _setPageAction(appState.currentAction);
          pushWidget(appState.currentAction.widget!, appState.currentAction.page!);
          break;
        case PageState.ADD_ALL:
          addAll(appState.currentAction.pages!);
          break;
      }
    }
    appState.resetCurrentAction();
    return List.of(_pages);
  }


  void parseRoute(Uri uri) {
    if (uri.pathSegments.isEmpty) {
      setNewRoutePath(splashScreenConfig);
      return;
    }

    if (uri.pathSegments.length == 1) {
      final path = uri.pathSegments[0];
      switch (path) {
        case 'splash':
          replaceAll(splashScreenConfig);
          break;
        case 'welcome':
          replaceAll(welcomeScreenConfig);
          break;
        case 'login':
          setPath([
            _createPage(LoginScreen(), loginScreenConfig)
          ]);
          break;
        case 'signUp':
          setPath([
            _createPage(LoginScreen(), loginScreenConfig),
            _createPage(SignUpScreen(), signUpScreenConfig)
          ]);
          break;
        case 'main':
          replaceAll(mainScreenConfig);
          break;
        case 'myPage':
          setPath([
            _createPage(MainScreen(), mainScreenConfig),
            _createPage(MyPageScreen(), myPageScreenConfig)
          ]);
          break;
      }
    }
  }
}