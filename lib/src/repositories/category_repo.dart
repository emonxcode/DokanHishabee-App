import '../constants/api_endpoints.dart';
import '../service/network_api_service.dart';

class CategoryRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> createCategory(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postApi(data, ApiUrl.createCategoryUrl);

      return response;
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
