import 'package:flutter/material.dart';
import 'package:moim_app/screens/map/naver/padding_test.dart';
import 'package:moim_app/screens/map/naver/path_map.dart';
import 'package:moim_app/screens/map/naver/polygon_map.dart';
import 'package:moim_app/screens/map/naver/text_field_page.dart';

import 'base_map.dart';
import 'circle_map.dart';
import 'marker_map.dart';

class MoimNaverMapScreen extends StatefulWidget {
  static const String route = '/kakaoMap';

  const MoimNaverMapScreen({Key? key}) : super(key: key);

  @override
  State<MoimNaverMapScreen> createState() => _MoimNaverMapScreen();
}

class _MoimNaverMapScreen extends State<MoimNaverMapScreen> {
  List<String> menuText = [
    '기본 지도 예제',
    '마커 예제',
    '패스 예제',
    '원형 오버레이 예제',
    '컨트롤러 테스트',
    '폴리곤 예제',
    'GLSurface Thread collision test',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: menuText
              .map((text) => GestureDetector(
                    onTap: () => _onTapMenuItem(text),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.indigo),
                      ),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  _onTapMenuItem(String text) {
    final index = menuText.indexOf(text);
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BaseMapPage(),
            ));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MarkerMapPage(),
            ));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PathMapPage(),
            ));
        break;
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CircleMapPage(),
            ));
        break;
      case 4:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaddingTest(),
            ));
        break;
      case 5:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PolygonMap(),
            ));
        break;
      case 6:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TextFieldPage(),
            ));
    }
  }
}
