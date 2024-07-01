import 'dart:convert';

import 'package:face5/models/loginmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../utilities/common.dart';

class AuthService extends ChangeNotifier {
  var baseurl = CommonContentString.BaseAPIUrl;
  final logger = Logger();

  Future<LoginModel> login(userName, password, mobileType) async {
    try {
      Uri url = Uri.parse("$baseurl/face5/users/login");
      http.Response response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            "user_id": userName,
            "password": password,
            "role": mobileType
          }));
      var result = jsonDecode(response.body);
      logger.i(result);
      if (response.statusCode == 200) {
        LoginModel res = LoginModel.fromJson(result);
        return res;
      } else {
        LoginModel res = LoginModel.fromJson(result);
        return res;
      }
    } catch (e) {
      rethrow;
    }
  }
}
