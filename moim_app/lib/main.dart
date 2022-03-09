import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moim_app/core/router/moim_back_button_dispatcher.dart';
import 'package:moim_app/core/router/moim_route_parser.dart';
import 'package:moim_app/core/router/moim_router_delegate.dart';
import 'package:moim_app/core/storage/local_storage.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

import 'core/constants/design_system.dart';
import 'core/router/app_state.dart';
import 'core/router/router_consts.dart';
import 'core/storage/shared_preference_local_storage.dart';

void main() => runApp(const MoimApp());

class MoimApp extends StatefulWidget {
  const MoimApp({Key? key}) : super(key: key);

  @override
  _MoimAppState createState() => _MoimAppState();
}

class _MoimAppState extends State<MoimApp> {
  LocalStorage localStorage = SharedPreferenceLocalStorage();

  final appState = AppState();
  final parser = MoimRouteParser();
  late MoimRouterDelegate delegate;
  late MoimBackButtonDispatcher dispatcher;

  StreamSubscription? _linkSubscription;

  _MoimAppState() {
    delegate = MoimRouterDelegate(appState);
    delegate.setNewRoutePath(welcomePageConfig);
    dispatcher = MoimBackButtonDispatcher(delegate);
  }

  @override
  void initState() {
    super.initState();
    localStorage.init();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _linkSubscription = linkStream.listen((event) {
      var parse = Uri.parse(event?? '');
      if (!mounted) return;
      setState(() {
        delegate.parseRoute(parse);
      });
    }, onError: (Object err) {
      print('Got error $err');
    });
  }

  @override
  void dispose() {
    localStorage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => appState,
      child: MaterialApp.router(
        title: 'Moim',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        backButtonDispatcher: dispatcher,
        routeInformationParser: parser,
        routerDelegate: delegate
      ),
    );
  }
}
