import 'dart:convert';
import 'package:e_learning/shared_preference/shared_prefernces.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoCallParam {
  Future<String> toJson() async {
    SharedPreferenceData sharedPreferenceData = SharedPreferenceData();
    SharedPreferences sharedPreferences =
        await SharedPreferenceData().getSharedPreferences();
    final Map<String, dynamic> requestParam = <String, dynamic>{};
    requestParam["role"] =
        sharedPreferences.getBool(sharedPreferenceData.isTeacher) == true
            ? 'teacher'
            : 'student';
    requestParam['id'] =
        sharedPreferences.getString(sharedPreferenceData.email);
    requestParam['username'] =
        sharedPreferences.getString(sharedPreferenceData.userId);
    requestParam['sessionname'] = "709117";
    requestParam['classname'] = "Any thing";
    requestParam['totalstudents'] = 100;
    requestParam['avatar'] = "";
    requestParam['accesstoken'] =
        sharedPreferences.getString(sharedPreferenceData.accessToken);
    requestParam['name'] =
        sharedPreferences.getString(sharedPreferenceData.name);
    var url =
        "https://learning.profices.in/mobile/video-call/customize?userinfo=" +
            const JsonEncoder().convert(requestParam);
    print(url);
    return url;
    // .replaceFirst("{", "%7B")
    //  .replaceFirst("}", "%7D");
  }
}
