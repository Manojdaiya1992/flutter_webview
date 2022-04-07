import 'dart:convert';

import 'package:e_learning/models/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  final String accessToken = "accessToken";
  final String userId = "userId";
  final String mobileNumber = "mobileNumber";
  final String email = "email";
  final String isTeacher = "isTeacher";
  final String name = "name";
  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  addAuthData(LoginResponse loginResponse) async {
    SharedPreferences preferences = await getSharedPreferences();
    preferences.setString(accessToken, loginResponse.accessToken);
    preferences.setString(userId, loginResponse.userId);
    preferences.setString(mobileNumber, loginResponse.mobileNumber);
    preferences.setString(email, loginResponse.email);
    print(loginResponse.role.authority
            .toLowerCase()
            .trim()
            .compareTo("student") !=
        0);
    preferences.setBool(
        isTeacher,
        loginResponse.role.authority
                .toLowerCase()
                .trim()
                .compareTo("student") !=
            0);
    preferences.setString(name, loginResponse.firstName);
  }
}
