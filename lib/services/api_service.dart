import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_login_api_project/model/login_model.dart';

import '../model/signup_model.dart';

class ApiService {
  Future<SignUpModel?> signup(
    String firstName,
    String lastName,
    String email,
    String gender,
    String password,
    String number,
    String address,
  ) async {
    var response = await http.post(
      Uri.parse("https://edugaondev.com/firebase-api-main/api/signup"),
      body: {
        "address": address,
        "agent_id": "2",
        "email": email,
        "password": password,
        "fcm_token": "ksbd-m nkca",
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "new_user": "0",
        "number": number,
        "other_referral_code": "dfv-dfv -sdf",
        "referral_code": "wedfv-dfv",
        "status": "1",
        "type": "user",
      },
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var data = SignUpModel.fromJson(json);
      return data;
    }
  }

  Future<LoginModel?> login(String email, String password) async {
    var response = await http.post(
      Uri.parse("https://edugaondev.com/firebase-api-main/api/login"),
      body: {"email": email, "password": password},
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var data = LoginModel.fromJson(json);
      return data;
    }
  }
}
