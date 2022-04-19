import 'package:inzynierka/models/dto/meal_dto.dart';
import 'package:inzynierka/models/meal_day.dart';

class MealDayDto {
  MealDayDto(
      {required this.dateAdded,
      required this.addedBy,
      this.mealList = const []});
  int? dateAdded;
  String? addedBy;
  List<MealDto> mealList;

  MealDayDto.fromJson(Map<String, dynamic> json)
      : dateAdded = json['dateAdded'] as int?,
        addedBy = json['addedBy'] as String?,
        mealList = json['mealList'] == null
            ? []
            : (json['mealList'] as List<dynamic>)
                .map((e) => MealDto.fromJson(e as Map<String, dynamic>))
                .toList();

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> mealList =
        this.mealList.map((e) => e.toJson()).toList();
    return {
      'dateAdded': dateAdded,
      'addedBy': addedBy,
      'mealList': mealList,
    };
  }

  MealDay toModel() {
    return MealDay(
        dateAdded: dateAdded ?? 0,
        addedBy: addedBy ?? "",
        mealList: mealList.map((e) => e.toModel()).toList());
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

  static List<MealDto> listFromJson(Iterable iterable) {
    List<MealDto> mealDtoList =
        List<MealDto>.from(iterable.map((model) => MealDto.fromJson(model)));
    return mealDtoList;
  }
}
