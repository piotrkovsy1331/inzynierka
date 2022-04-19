import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inzynierka/models/dto/meal_dto.dart';
import 'package:inzynierka/models/meal_day.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_day_dto.g.dart';

@JsonSerializable()
class MealDayDto {
  MealDayDto(
      {required this.dateAdded,
      required this.addedBy,
      this.mealList = const []});
  int? dateAdded;
  String? addedBy;
  List<MealDto> mealList;

  factory MealDayDto.fromJson(Map<String, dynamic> json) =>
      _$MealDayDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MealDayDtoToJson(this);

  MealDay toModel() {
    return MealDay(
        dateAdded: dateAdded ?? 0,
        addedBy: addedBy ?? "",
        mealList:
            mealList != null ? mealList.map((e) => e.toModel()).toList() : []);
  }

  static MealDayDto fromModel(MealDay mealDay) {
    return MealDayDto(
        dateAdded: mealDay.dateAdded,
        addedBy: mealDay.addedBy,
        mealList: mealDay.mealList != null
            ? mealDay.mealList!
                .map<MealDto>((e) => MealDto.fromModel(e))
                .toList()
            : []);
  }

  static MealDayDto fromDocument(DocumentSnapshot doc) {
    return MealDayDto(
        dateAdded: doc['dateAdded'],
        addedBy: doc['addedBy'],
        mealList: listFromJson(jsonDecode(doc['mealList'])));
  }

  static List<MealDto> listFromJson(Iterable iterable) {
    List<MealDto> mealDtoList =
        List<MealDto>.from(iterable.map((model) => MealDto.fromJson(model)));
    return mealDtoList;
  }
}
