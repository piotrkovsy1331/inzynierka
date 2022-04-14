// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealDto _$MealDtoFromJson(Map<String, dynamic> json) => MealDto(
      mealTypeName: json['mealTypeName'] as String?,
      mealDetails: json['mealDetails'] == null
          ? null
          : DetailsDto.fromJson(json['mealDetails'] as Map<String, dynamic>),
      productList: (json['productList'] as List<dynamic>?)
          ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealDtoToJson(MealDto instance) => <String, dynamic>{
      'mealTypeName': instance.mealTypeName,
      'mealDetails': instance.mealDetails,
      'productList': instance.productList,
    };
