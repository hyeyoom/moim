import 'dart:convert';

import 'package:http/http.dart' as http;

class MockApi {
  Future<UserJoinResponse> join(UserJoinRequest request) async {
    var client = http.Client();
    try {
      var response = await client.post(
          Uri.http('http://localhost:8080', '/users'),
          body: {'email': request.email, 'password': request.password});
      var map = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return UserJoinResponse(map['uri'] as int);
    } finally {
      client.close();
    }
  }

  Future<UserAuthenticationResponse> auth(UserAuthenticationRequest request) async {
    var client = http.Client();
    try {
      var response = await client.post(
          Uri.http('http://localhost:8080', '/users/authentication'),
          body: {'email': request.email, 'password': request.password});
      var map = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return UserAuthenticationResponse(map['refresh_token'] as String);
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
  String? refreshToken;

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
