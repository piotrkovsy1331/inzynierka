import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inzynierka/models/details.dart';

class DetailsDto {
  DetailsDto(
      {required this.calories,
      required this.fat,
      required this.protein,
      required this.sugar,
      required this.weight});

  int? weight;
  int? calories;
  int? protein;
  int? fat;
  int? sugar;

  DetailsDto.fromJson(Map<String, dynamic> json)
      : weight = json['weight'] as int?,
        calories = json['calories'] as int?,
        protein = json['protein'] as int?,
        fat = json['fat'] as int?,
        sugar = json['sugar'] as int?;

  Map<String, dynamic> toJson() => {
        'weight': weight,
        'calories': calories,
        'protein': calories,
        'fat': fat,
        'sugar': sugar,
      };

  Details toModel() {
    return Details(
        calories: calories ?? 0,
        protein: protein ?? 0,
        fat: fat ?? 0,
        sugar: sugar ?? 0,
        weight: weight ?? 0);
  }

  static DetailsDto fromModel(Details details) {
    return DetailsDto(
        calories: details.calories,
        fat: details.fat,
        protein: details.protein,
        sugar: details.sugar,
        weight: details.weight);
  }

  static DetailsDto fromDocumentSnapshot(DocumentSnapshot doc) {
    return DetailsDto(
        calories: int.parse(doc['calories']),
        fat: int.parse(doc['fat']),
        protein: int.parse(doc['protein']),
        sugar: int.parse(doc['sugar']),
        weight: int.parse(doc['weight']));
  }
}
