import 'package:moim_app/core/router/router_page_configuration.dart';
import 'package:moim_app/core/router/router_pages.dart';

const String loggedInKey = 'LoggedIn';

const String welcomePath = '/welcome';
const String loginPath = '/login';
const String signUpPath = '/signUp';
const String mainPath = '/main';
const String myPagePath = '/myPage';

PageConfiguration welcomePageConfig = PageConfiguration(key: 'welcome', path: loginPath, uiPage: Pages.WELCOME, currentPageAction: null);
PageConfiguration loginPageConfig   = PageConfiguration(key: 'login'  , path: loginPath, uiPage: Pages.LOGIN, currentPageAction: null);
PageConfiguration signUpPageConfig  = PageConfiguration(key: 'signUp' , path: signUpPath, uiPage: Pages.SIGN_UP, currentPageAction: null);
PageConfiguration mainPageConfig    = PageConfiguration(key: 'main'   , path: mainPath, uiPage: Pages.MAIN, currentPageAction: null);
PageConfiguration myPageConfig      = PageConfiguration(key: 'myPage' , path: myPagePath, uiPage: Pages.MY_PAGE, currentPageAction: null);
