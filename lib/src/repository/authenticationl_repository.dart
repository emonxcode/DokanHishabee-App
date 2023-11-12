
import '../constants/api_endpoints.dart';
import '../service/network_api_service.dart';

class AuthenticationRepository {
  final _apiServices = NetworkApiServices();
  // Future<dynamic> requestOTP(dynamic data) async {
  //   try {
  //     dynamic response = await _apiServices.postApi(data, Urls.otpRequest);

  //     return response;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<dynamic> verifyOTP(dynamic data) async {
  //   try {
  //     dynamic response = await _apiServices.postApi(data, Urls.verify_otp);
  //     print(response);
  //     return response;
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<dynamic> resendOTP(dynamic data) async {
  //   try {
  //     dynamic response = await _apiServices.postApi(data, Urls.resend_otp);

  //     return response;
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<dynamic> completeRegistration(dynamic data) async {
  //   try {
  //     dynamic response = await _apiServices.postApi(data, Urls.info_update);

  //     return response;
  //   } catch (e) {
  //     return e;
  //   }
  // }

    Future<dynamic> login(dynamic data) async {
    try {
      dynamic response = await _apiServices.postApi(data, ApiUrl.loginUrl);

      return response;
    } catch (e) {
      return e;
    }
  }
}
