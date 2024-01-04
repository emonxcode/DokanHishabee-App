import 'dart:convert';
import 'dart:io';
import 'package:amar_dokan_app/src/local/shared_preference_helper.dart';
import 'package:flutter/material.dart';

import '../constants/api_endpoints.dart';
import '../service/network_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class CategoryRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> createCategory(dynamic data, File file) async {
    
    try {
      var token = await LocalData.getToken();
      var request =
          http.MultipartRequest("POST", Uri.parse(ApiUrl.createCategoryUrl));
      request.fields['name'] = data['name'];
      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        file.path,
        contentType: MediaType('image', 'jpeg'),
      ));

      var response = await request.send();
      debugPrint(response.statusCode.toString());
      var result = await response.stream.bytesToString();
      debugPrint(result);
      return json.decode(result);
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> getCategories() async {
    try {
      dynamic response = await _apiServices.getApi(ApiUrl.categoryUrl);

      return response;
    } catch (e) {
      return e;
    }
  }
}
