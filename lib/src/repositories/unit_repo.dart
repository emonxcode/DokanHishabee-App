import '../constants/api_endpoints.dart';
import '../service/network_api_service.dart';

class UnitRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> createUnit(dynamic data) async {
    try {
      var response = _apiServices.postApi(data, ApiUrl.createUnitUrl);
      return response;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> getUnits() async {
    try {
      dynamic response = await _apiServices.getApi(ApiUrl.getUnitsUrl);

      return response;
    } catch (e) {
      return e;
    }
  }
}
