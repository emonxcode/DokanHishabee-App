import '../constants/api_endpoints.dart';
import '../service/network_api_service.dart';

class AuthenticationRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> login(dynamic data) async {
    try {
      dynamic response = await _apiServices.postApi(data, ApiUrl.loginUrl);

      return response;
    } catch (e) {
      return e;
    }
  }

}
