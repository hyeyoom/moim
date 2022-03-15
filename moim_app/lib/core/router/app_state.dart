import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moim_app/core/router/router_consts.dart';
import 'package:moim_app/core/router/router_page_action.dart';
import 'package:moim_app/core/router/router_page_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../storage/local_storage.dart';
import '../storage/shared_preference_local_storage.dart';

class AppState extends ChangeNotifier {

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  bool _initFinished = false;
  bool get initFinished => _initFinished;

  LocalStorage localStorage = SharedPreferenceLocalStorage();

  PageAction _currentAction = PageAction();
  PageAction get currentAction => _currentAction;

  set currentAction(PageAction action) {
    _currentAction = action;
    notifyListeners();
  }

  AppState() {
    getLoggedInState();
  }

  void setInitFinished() {
    _initFinished = true;
    if (_loggedIn) {
      _currentAction = PageAction(state: PageState.REPLACE_ALL, page: mainScreenConfig);
    } else {
      _currentAction = PageAction(state: PageState.REPLACE_ALL, page: welcomeScreenConfig);
    }
    notifyListeners();
  }

  void openLogin() {
    _currentAction = PageAction(state: PageState.ADD_PAGE, page: loginScreenConfig);
    notifyListeners();
  }

  void openSignUp() {
    _currentAction = PageAction(state: PageState.ADD_PAGE, page: signUpScreenConfig);
    notifyListeners();
  }

  void resetCurrentAction() {
    _currentAction = PageAction();
  }

  void login() {
    _loggedIn = true;
    saveLoginState(loggedIn);
    _currentAction = PageAction(state: PageState.REPLACE_ALL, page: mainScreenConfig);
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    saveLoginState(loggedIn);
    _currentAction = PageAction(state: PageState.REPLACE_ALL, page: welcomeScreenConfig);
    notifyListeners();
  }

  void saveLoginState(bool loggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(loggedInKey, loggedIn);
  }

  void getLoggedInState() async {
    final prefs = await SharedPreferences.getInstance();
    print('loggedInKey=$loggedInKey [currentLoginStatus=$_loggedIn]');
    _loggedIn = prefs.getBool(loggedInKey)?? false;
  }
}
