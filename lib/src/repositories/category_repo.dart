import 'dart:convert';
import 'dart:io';
import 'package:amar_dokan_app/src/local/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
      return returnResponse(response);
    } catch (e) {
      print(e.toString());
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

dynamic returnResponse(StreamedResponse response) async {
  switch (response.statusCode) {
    case 200:
      var result = await response.stream.bytesToString();
      dynamic responseJson = json.decode(result);
      return responseJson;
    case 400:
      var result = await response.stream.bytesToString();
      dynamic responseJson = json.decode(result);
      print(responseJson.toString());
      return responseJson;
    case 401:
      var result = await response.stream.bytesToString();
      dynamic responseJson = json.decode(result);
      return responseJson;
    case 500:
      var result = await response.stream.bytesToString();
      dynamic responseJson = json.decode(result);
      return responseJson;
    case 422:
      var result = await response.stream.bytesToString();
      dynamic responseJson = json.decode(result);
      return responseJson;
    default:
      throw Exception(
          'Error ccoured while communicating with server ${response.statusCode}');
  }
}
