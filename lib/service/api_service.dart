import 'package:flutter_application_api/model/user_model.dart';
import 'package:flutter_application_api/service/constants.dart';

import 'package:http/http.dart' as http;

import 'dart:developer';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseurl + ApiConstants.userEndPoint);

      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
