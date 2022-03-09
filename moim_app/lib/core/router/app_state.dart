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

  void openLogin() {
    _currentAction = PageAction(state: PageState.ADD_PAGE, page: loginPageConfig);
    notifyListeners();
  }

  void openSignUp() {
    _currentAction = PageAction(state: PageState.ADD_PAGE, page: signUpPageConfig);
    notifyListeners();
  }

  void resetCurrentAction() {
    _currentAction = PageAction();
  }

  void login() {
    _loggedIn = true;
    saveLoginState(loggedIn);
    _currentAction = PageAction(state: PageState.REPLACE_ALL, page: mainPageConfig);
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    saveLoginState(loggedIn);
    _currentAction = PageAction(state: PageState.REPLACE_ALL, page: loginPageConfig);
    notifyListeners();
  }

  void saveLoginState(bool loggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(loggedInKey, loggedIn);
  }

  void getLoggedInState() async {
    final prefs = await SharedPreferences.getInstance();
    print('loggedInKe=$loggedInKey');
    if(loggedInKey.isEmpty) {
      _loggedIn = prefs.getBool(loggedInKey)!;
    } else {
      _loggedIn = false;
    }
    if (_loggedIn == null) {
      print('loggedIn is null');
      _loggedIn = false;
    }
  }
}