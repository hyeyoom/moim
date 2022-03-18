import 'package:flutter/material.dart';

import 'moim_kakao_map_body.dart';

class MoimKakaoMapScreen extends StatefulWidget {
  static const String route = '/kakaoMap';

  const MoimKakaoMapScreen({Key? key}) : super(key: key);

  @override
  State<MoimKakaoMapScreen> createState() => _MoimKakaoMapScreen();
}

class _MoimKakaoMapScreen extends State<MoimKakaoMapScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Moim kakao map webview')),
      body: MoimKakaoMapBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
