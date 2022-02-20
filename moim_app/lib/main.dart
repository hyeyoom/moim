import 'package:flutter/material.dart';
import 'package:moim_app/core/storage/local_storage.dart';
import 'package:moim_app/screens/intro/welcome/welcome_screen.dart';
import 'package:moim_app/screens/main/main_screen.dart';

import 'core/constants/design_system.dart';
import 'core/storage/shared_preference_local_storage.dart';

void main() => runApp(const MoimApp());

class MoimApp extends StatefulWidget {
  const MoimApp({Key? key}) : super(key: key);

  @override
  _MoimAppState createState() => _MoimAppState();
}

class _MoimAppState extends State<MoimApp> {
  LocalStorage localStorage = SharedPreferenceLocalStorage();

  @override
  void initState() {
    localStorage.init();
    super.initState();
  }

  @override
  void dispose() {
    localStorage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moim',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: determineScreen(),
    );
  }

  // FIXME: 분명 라우트하는 방식이 있을거임.
  Widget determineScreen() {
    String? refreshKey = localStorage.load('refresh_key');
    if (refreshKey == null) {
      return const WelcomeScreen();
    }
    return const MainScreen();
  }
}

/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    */
/*return MaterialApp(
      title: 'Moim',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const WelcomeScreen(),
    );*/ /*

    return const WelcomeScreen();
  }
}
*/
