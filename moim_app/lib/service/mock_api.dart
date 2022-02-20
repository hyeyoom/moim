import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MockApi {
  Future<UserJoinResponse> join(UserJoinRequest request) async {
    var client = http.Client();
    var data = {'email': request.email, 'password': request.password};
    var body = json.encode(data);
    try {
      var response = await client.post(
        Uri.http('10.0.2.2:8080', '/users'),
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
        Uri.http('10.0.2.2:8080', '/users/authentication'),
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
