class ApiUrl {
  static const String baseApiUrl = 'http://10.0.2.2:2024/api/';
  //static const String baseApiUrl = 'http://artix-studio.xyz/api/';
  static String loginUrl = '${baseApiUrl}user/login';
  static String categoryUrl = '${baseApiUrl}category/getAllCategory';
  static String createCategoryUrl = '${baseApiUrl}category/createCategory';
  static String getUnitsUrl = '${baseApiUrl}unit/getAllUnits';
  static String createUnitUrl = '${baseApiUrl}unit/createUnit';

  static const String baseUrl = 'http://10.0.2.2:2024';
  //static const String baseUrl = 'http://artix-studio.xyz';
}
