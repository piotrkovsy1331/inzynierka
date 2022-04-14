import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inzynierka/models/details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details_dto.g.dart';

@JsonSerializable()
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

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory DetailsDto.fromJson(Map<String, dynamic> json) =>
      _$DetailsDtoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DetailsDtoToJson(this);

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
