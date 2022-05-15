import 'package:dio/dio.dart';
import 'package:inzynierka/logics/hubs/search_product_hub.dart';
import 'package:inzynierka/models/api_product.dart';
import 'package:inzynierka/models/details.dart';
import 'package:inzynierka/models/dto/api_nutrition_info_dto.dart';
import 'package:inzynierka/models/dto/api_product_dto.dart';
import 'package:inzynierka/models/product.dart';

class SearchProductInfoRepository {
  SearchProductInfoRepository._internal();

  factory SearchProductInfoRepository() {
    return _instance;
  }

  static final SearchProductInfoRepository _instance =
      SearchProductInfoRepository._internal();

  /// Get result of searching for a products
  Future<List<ApiProduct>> getSearchedProdustList(String value) async {
    ApiProductDto apiNutritionProductsResponse;

    Response response =
        await SearchProductInfoHub().getSearchedProdustList(value);
    apiNutritionProductsResponse = ApiProductDto.fromJson(response.data);

    return apiNutritionProductsResponse.toApiProductsList();
  }

  /// Get info about specific product choosed from searche result list
  Future<Product> getProductNutritionInfo(String value) async {
    List<Product> _returnArray = [];
    ApiNutritionInfoDto apiNutritionListRsponse;
    Response response =
        await SearchProductInfoHub().getProductNutritionInfo(value);

    apiNutritionListRsponse = ApiNutritionInfoDto.fromJson(response.data);

    for (Food food in apiNutritionListRsponse.foods) {
      _returnArray.add(Product(
          name: food.foodName ?? '',
          productDetails: Details(
              calories: food.nfCalories != null ? food.nfCalories!.toInt() : 0,
              fat: food.nfTotalFat != null ? food.nfTotalFat!.toInt() : 0,
              protein: food.nfProtein != null ? food.nfProtein!.toInt() : 0,
              sugar: food.nfSugars != null ? food.nfSugars!.toInt() : 0,
              weight: food.servingQty != null ? food.servingQty!.toInt() : 0)));
    }
    return _returnArray.first;
  }
}
