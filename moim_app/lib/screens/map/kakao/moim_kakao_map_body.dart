import 'package:flutter/material.dart';

import 'package:kakaomap_webview/kakaomap_webview.dart';

import 'moim_kakao_map_address_search.dart';

const String kakaoMapKey = 'yourKakaoJavaScriptKey';

class MoimKakaoMapBody extends StatelessWidget {
  const MoimKakaoMapBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _mapController;

    return Column(
      children: [
        AddressSearchPage(),
        Flexible(
          child: KakaoMapView(
              width: size.width,
              height: size.height - 200,
              kakaoMapKey: kakaoMapKey,
              lat: 37.48041991631226,
              lng: 127.1266311906996,
              showMapTypeControl: true,
              showZoomControl: true,
              draggableMarker: true,
              mapType: MapType.BICYCLE,
              mapController: (controller) {
                _mapController = controller;
              },
              polygon: KakaoPolygon(
                  polygon: [
                    KakaoLatLng(37.48035991631226, 127.1265311906996),
                    KakaoLatLng(37.48051991631226, 127.1265311906996),
                    KakaoLatLng(37.48051991631226, 127.1267311906996),
                    KakaoLatLng(37.48035991631226, 127.1267311906996)
                  ],
                  polygonColor: Colors.red,
                  polygonColorOpacity: 0.3,
                  strokeColor: Colors.deepOrange,
                  strokeWeight: 2.5,
                  strokeColorOpacity: 0.9),
              // overlayText: '카카오!',
              customOverlayStyle: '''<style>
              .customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
              </style>''',
              customOverlay: '''
var content = '<div class="customoverlay">' +
    '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
    '    <span class="title">EDDI!</span>' +
    '  </a>' +
    '</div>';

var position = new kakao.maps.LatLng(37.48041991631226, 127.1266311906996);

var customOverlay = new kakao.maps.CustomOverlay({
    map: map,
    position: position,
    content: content,
    yAnchor: 1
});
              ''',
              markerImageURL:
                  'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
              onTapMarker: (message) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message.message)));
              },
              zoomChanged: (message) {
                debugPrint('current zoom level : ${message.message}');
              },
              cameraIdle: (message) {
                KakaoMapUtil util = KakaoMapUtil();
                KakaoLatLng latlng = util.getLatLng(message.message);
                debugPrint('current lat lng : ${latlng.lat}, ${latlng.lng}');
              }),
          //
          //
          //
          //
        )
      ],
    );
  }
}
