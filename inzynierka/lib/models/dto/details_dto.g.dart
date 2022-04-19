// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsDto _$DetailsDtoFromJson(Map<String, dynamic> json) => DetailsDto(
      calories: json['calories'] as int?,
      fat: json['fat'] as int?,
      protein: json['protein'] as int?,
      sugar: json['sugar'] as int?,
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$DetailsDtoToJson(DetailsDto instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'calories': instance.calories,
      'protein': instance.protein,
      'fat': instance.fat,
      'sugar': instance.sugar,
    };
