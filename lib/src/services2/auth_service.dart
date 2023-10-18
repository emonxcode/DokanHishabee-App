import 'dart:convert';
import 'dart:io';

import 'package:amar_dokan_app/src/helpers/constants/api_endpoints.dart';
import 'package:amar_dokan_app/src/helpers/shared_preference_helper.dart';
import 'package:http/http.dart' as http;

class AuthService {
  

  Future<bool> login(String mobile, String password) async {
    try {
      var headers = {"Content-Type": "application/json"};
      var body = json.encode({"mobile": mobile, "password": password});
      var response = await http.post(Uri.parse(ApiUrl.loginUrl),
          body: body, headers: headers);

      if (response.statusCode == 200) {
        var result = json.decode(response.body);

        if (result['success'] == true) {
          await SharedPreferencesHelper.setToken(result['token']);
          await SharedPreferencesHelper.setLoginUserName(
              result['user']['name']);
          await SharedPreferencesHelper.setLoginUserMobileNo(
              result['user']['mobile']);
          await SharedPreferencesHelper.setUserAddress(
              result['user']['address']);
          await SharedPreferencesHelper.setShopId(result['user']['shop_id']);
          await SharedPreferencesHelper.setUserId(result['user']['id']);
          await SharedPreferencesHelper.setRole(result['user']['role']);
          await SharedPreferencesHelper.setSubcriptionStatus(
              result['user']['subscription_status']);
          await SharedPreferencesHelper.setLoginFlag(true);

          return true;
        } else {
          return false;
        }
      } else {
        print(response.body.toString());
        return false;
      }
    }on SocketException{
      throw Exception("No internet!");
    }
     catch (ex) {
      throw ex;
    }
  }
}
