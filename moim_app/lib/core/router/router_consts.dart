import 'package:moim_app/core/router/router_page_configuration.dart';
import 'package:moim_app/core/router/router_pages.dart';

const String loggedInKey = 'LoggedIn';

const String splashPath = '/splash';
const String welcomePath = '/welcome';
const String loginPath = '/login';
const String signUpPath = '/signUp';
const String mainPath = '/main';
const String myPagePath = '/myPage';

PageConfiguration splashScreenConfig  = PageConfiguration(key: 'splash' , path: splashPath, uiPage: Pages.SPLASH, currentPageAction: null);
PageConfiguration welcomeScreenConfig = PageConfiguration(key: 'welcome', path: welcomePath, uiPage: Pages.WELCOME, currentPageAction: null);
PageConfiguration loginScreenConfig   = PageConfiguration(key: 'login'  , path: loginPath, uiPage: Pages.LOGIN, currentPageAction: null);
PageConfiguration signUpScreenConfig  = PageConfiguration(key: 'signUp' , path: signUpPath, uiPage: Pages.SIGN_UP, currentPageAction: null);
PageConfiguration mainScreenConfig    = PageConfiguration(key: 'main'   , path: mainPath, uiPage: Pages.MAIN, currentPageAction: null);
PageConfiguration myPageScreenConfig  = PageConfiguration(key: 'myPage' , path: myPagePath, uiPage: Pages.MY_PAGE, currentPageAction: null);
