import 'package:dio/dio.dart';

class SearchProductInfoHub {
  SearchProductInfoHub._internal();

  factory SearchProductInfoHub() {
    return _instance;
  }

  static final SearchProductInfoHub _instance =
      SearchProductInfoHub._internal();
  final Dio _dio = Dio();

  Future<Response> getSearchedProdustList(String value) async {
    RequestOptions options = RequestOptions(
        method: 'GET',
        baseUrl: 'https://trackapi.nutritionix.com/V2/search/instant',
        path: '',
        headers: {
          'x-app-id': '460fc3b4',
          "x-app-key": 'e27ccc02c41d94a0769a07f753c56442'
        },
        queryParameters: {
          'query': value,
        });
    Response response = await _dio.fetch(options);
    return response;
  }

  Future<Response> getProductNutritionInfo(String value) async {
    RequestOptions options = RequestOptions(
        method: 'POST',
        baseUrl: 'https://trackapi.nutritionix.com/v2/natural/nutrients',
        path: '',
        headers: {
          'x-app-id': '460fc3b4',
          "x-app-key": 'e27ccc02c41d94a0769a07f753c56442',
          "x-remote-user-id": 0
        },
        data: {
          "query": value
        });
    Response response = await _dio.fetch(options);
    return response;
  }
}
