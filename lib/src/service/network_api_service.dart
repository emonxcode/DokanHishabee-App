import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import '../local/shared_preference_helper.dart';
import '../utils/log/log.dart';
import 'base_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(url) async {
    if (kDebugMode) {
      log.e(url);
    }

    var headers = {
      "Accept": "application/json",
      'Content-type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': 'Bearer ${await LocalData.getToken()}',
    };

    dynamic responseJson;
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      responseJson = returnResponse(response);
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
    } catch (e) {
      rethrow;
    }
    // on SocketException {
    //   throw InternetException('');
    // }on RequestTimeOut {
    //   throw RequestTimeOut('');
    //
    // }
    // print(responseJson);
    return responseJson;
  }

  @override
  Future<dynamic> postApi(payload, url) async {
    if (kDebugMode) {
      debugPrint(url);
      debugPrint(payload.toString());
    }
    var headers = {
      "Accept": "application/json",
      'Content-type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': 'Bearer ${await LocalData.getToken()}',
    };
    debugPrint(await LocalData.getToken());
    dynamic responseJson;
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(payload),
      );
      responseJson = returnResponse(response);
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
    } catch (e) {
      rethrow;
    }
    // on SocketException {
    //   throw InternetException('');
    // }on RequestTimeOut {
    //   throw RequestTimeOut('');

    // }

    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = json.decode(response.body);
        return responseJson;
      case 401:
        dynamic responseJson = json.decode(response.body);
        return responseJson;
      case 500:
        dynamic responseJson = json.decode(response.body);
        return responseJson;
      case 422:
        dynamic responseJson = json.decode(response.body);
        return responseJson;
      default:
        throw Exception(
            'Error ccoured while communicating with server ${response.statusCode}');
    }
  }
}
