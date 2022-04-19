import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inzynierka/models/details.dart';
import 'package:inzynierka/models/dto/details_dto.dart';
import 'package:inzynierka/models/dto/product_dto.dart';
import 'package:inzynierka/models/meal.dart';

class MealDto {
  MealDto(
      {required this.mealTypeName,
      required this.mealDetails,
      required this.productList});

  String? mealTypeName;
  DetailsDto? mealDetails;
  List<ProductDto>? productList;

  MealDto.fromJson(Map<String, dynamic> json)
      : mealTypeName = json['mealTypeName'] as String?,
        mealDetails = json['mealDetails'] == null
            ? null
            : DetailsDto.fromJson(json['mealDetails'] as Map<String, dynamic>),
        productList = json['productList'] == null
            ? []
            : (json['productList'] as List<dynamic>)
                .map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
                .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic>? mealDetails =
        this.mealDetails != null ? this.mealDetails!.toJson() : null;
    List<Map<String, dynamic>>? productList = this.productList != null
        ? this.productList!.map((e) => e.toJson()).toList()
        : [];
    return {
      'mealTypeName': mealTypeName,
      'mealDetails': mealDetails,
      'productList': productList,
    };
  }

  Meal toModel() {
    return Meal(
        mealTypeName: mealTypeName ?? "",
        mealDetails: mealDetails != null
            ? mealDetails!.toModel()
            : Details(calories: 0, fat: 0, protein: 0, sugar: 0, weight: 0),
        productList: productList != null
            ? productList!.map((e) => e.toModel()).toList()
            : []);
  }

  static MealDto fromModel(Meal meal) {
    return MealDto(
        mealTypeName: meal.mealTypeName,
        mealDetails: DetailsDto.fromModel(meal.mealDetails),
        productList: meal.productList
            .map<ProductDto>((e) => ProductDto.fromModel(e))
            .toList());
  }

  static MealDto fromDocumentSnapShot(DocumentSnapshot doc) {
    return MealDto(
        mealTypeName: doc['mealTypeName'],
        mealDetails: DetailsDto.fromDocumentSnapshot(doc['mealDetails']),
        productList: listFromJson(jsonDecode(doc['productList'])));
  }

  static List<ProductDto> listFromJson(Iterable iterable) {
    List<ProductDto> productDtoList = List<ProductDto>.from(
        iterable.map((model) => ProductDto.fromJson(model)));
    return productDtoList;
  }
}
