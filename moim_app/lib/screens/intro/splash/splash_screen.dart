import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moim_app/core/router/app_state.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late AppState appState;
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    final query = MediaQuery.of(context);
    final size = query.size;
    final itemWidth = size.width;
    final itemHeight = itemWidth * (size.width / size.height);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Image.asset('assets/images/moim_splash.gif',
                width: itemWidth, height: itemHeight),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      Timer(const Duration(milliseconds: 2000), () {
        appState.setInitFinished();
      });
    }
  }
}
