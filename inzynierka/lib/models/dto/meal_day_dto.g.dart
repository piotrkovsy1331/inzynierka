// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_day_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealDayDto _$MealDayDtoFromJson(Map<String, dynamic> json) => MealDayDto(
      dateAdded: json['dateAdded'] as int?,
      addedBy: json['addedBy'] as String?,
      mealList: (json['mealList'] as List<dynamic>?)
              ?.map((e) => MealDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MealDayDtoToJson(MealDayDto instance) =>
    <String, dynamic>{
      'dateAdded': instance.dateAdded,
      'addedBy': instance.addedBy,
      'mealList': instance.mealList,
    };
