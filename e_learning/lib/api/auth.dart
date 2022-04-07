import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:e_learning/constants/api_baseurl.dart';
import 'package:e_learning/models/login_response.dart';
import 'package:e_learning/shared_preference/shared_prefernces.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthApiService {
  Future<LoginResponse> login(String username, String password) async {
    print(username);
    print(password);
    final response = await http.post(Uri.parse('$baseUrl/login'), headers: {
      HttpHeaders.authorizationHeader:
          'Basic JDJ5JDEyJGVVb3ZKdDN0VjJEeGZRRXNwYVB4Y3VjbVljUFlQQkdHb2pHb2lJMXZ0NE9pYzNoZm02Mnc2OiQyeSQxMiRRRUsvdnFteFdtTzNBTkJwSC81SVEuYjFwaVIzZGxrL05Qbi9FQ3ZkaUVsSy95dk96U3R5cQ==',
      HttpHeaders.contentTypeHeader:
          "application/x-www-form-urlencoded; charset=utf-8"
    }, body: {
      "grant_type": "password",
      "username": username,
      "password": password
    });
    final responseJson = jsonDecode(response.body);
    print(responseJson);
    return LoginResponse.fromJson(responseJson);
  }
}
