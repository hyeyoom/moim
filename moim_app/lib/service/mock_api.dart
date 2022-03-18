import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MockApi {
  static const String httpUri = 'localhost:8080';

  Future<UserJoinResponse> join(UserJoinRequest request) async {
    var client = http.Client();
    var data = {'email': request.email, 'password': request.password};
    var body = json.encode(data);
    try {
      var response = await client.post(
        Uri.http(httpUri, '/users'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      var map = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return UserJoinResponse(map['uri'] as int?);
    } finally {
      client.close();
    }
  }

  Future<UserAuthenticationResponse> auth(
      UserAuthenticationRequest request) async {
    var client = http.Client();
    var data = {'email': request.email, 'password': request.password};
    var body = json.encode(data);
    try {
      var response = await client.post(
        Uri.http(httpUri, '/users/authentication'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      var map = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      debugPrint('$map');
      return UserAuthenticationResponse(map['refreshToken'] as String);
    } finally {
      client.close();
    }
  }

  Future<LocationSearchResponse> locationSearch(
      LocationSearchRequest addressRequest) async {
    const String restAPIKey = "yourKakaoRESTKey";
    http.Response? response;

    try {
      response = await http.get(
          Uri.parse(
              'http://dapi.kakao.com/v2/local/search/address.json?query=${addressRequest.address}'),
          headers: {'Authorization': 'KakaoAK $restAPIKey'});
    } catch (e) {
      print('error : $e');
    }

    AddressModel model =
        AddressModel.fromJson(jsonDecode(response!.body)['documents'][0]);

    debugPrint('model : ${model.toJson()}');

    return LocationSearchResponse(model.toJson());
  }
}

class UserAuthenticationRequest {
  String email;
  String password;

  UserAuthenticationRequest(this.email, this.password);
}

class UserAuthenticationResponse {
  String refreshToken;

  UserAuthenticationResponse(this.refreshToken);
}

class UserJoinRequest {
  String email;
  String password;

  UserJoinRequest(this.email, this.password);
}

class UserJoinResponse {
  int? id;

  UserJoinResponse(this.id);
}

class LocationSearchRequest {
  String address;

  LocationSearchRequest(this.address);
}

class LocationSearchResponse {
  Map<String, dynamic> latlng;

  LocationSearchResponse(this.latlng);
}

class AddressModel {
  String? lat, lng;

  AddressModel({this.lat, this.lng});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(lat: json['y'], lng: json['x']);
  }

  List<String> toList() => [lng!, lat!];

  Map<String, dynamic> toJson() => {'x': lng, 'y': lat};
}
