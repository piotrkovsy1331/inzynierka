import 'package:meta/meta.dart';
import 'dart:convert';

class ApiNutritionInfoDto {
  ApiNutritionInfoDto({
    this.foods = const [],
  });

  List<Food> foods;

  factory ApiNutritionInfoDto.fromRawJson(String str) =>
      ApiNutritionInfoDto.fromJson(json.decode(str));

  factory ApiNutritionInfoDto.fromJson(Map<String, dynamic> json) =>
      ApiNutritionInfoDto(
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
      );
}

class Food {
  Food({
    @required this.foodName,
    @required this.brandName,
    @required this.servingQty,
    @required this.servingUnit,
    @required this.servingWeightGrams,
    @required this.nfCalories,
    @required this.nfTotalFat,
    @required this.nfSaturatedFat,
    @required this.nfCholesterol,
    @required this.nfSodium,
    @required this.nfTotalCarbohydrate,
    @required this.nfDietaryFiber,
    @required this.nfSugars,
    @required this.nfProtein,
    @required this.nfPotassium,
    @required this.nfP,
    @required this.fullNutrients,
    @required this.nixBrandName,
    @required this.nixBrandId,
    @required this.nixItemName,
    @required this.nixItemId,
    @required this.upc,
    @required this.consumedAt,
    @required this.metadata,
    @required this.source,
    @required this.ndbNo,
    @required this.tags,
    @required this.altMeasures,
    @required this.lat,
    @required this.lng,
    @required this.mealType,
    @required this.photo,
    @required this.subRecipe,
    @required this.classCode,
    @required this.brickCode,
    @required this.tagId,
  });

  String? foodName;
  dynamic brandName;
  double? servingQty;
  String? servingUnit;
  int? servingWeightGrams;
  double? nfCalories;
  double? nfTotalFat;
  double? nfSaturatedFat;
  double? nfCholesterol;
  double? nfSodium;
  double? nfTotalCarbohydrate;
  double? nfDietaryFiber;
  double? nfSugars;
  double? nfProtein;
  double? nfPotassium;
  double? nfP;
  List<FullNutrient>? fullNutrients;
  dynamic nixBrandName;
  dynamic nixBrandId;
  dynamic nixItemName;
  dynamic nixItemId;
  dynamic upc;
  DateTime? consumedAt;
  Metadata? metadata;
  int? source;
  int? ndbNo;
  Tags? tags;
  List<AltMeasure>? altMeasures;
  dynamic lat;
  dynamic lng;
  int? mealType;
  Photo? photo;
  dynamic subRecipe;
  dynamic classCode;
  dynamic brickCode;
  dynamic tagId;

  factory Food.fromRawJson(String str) => Food.fromJson(json.decode(str));

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        foodName: json["food_name"],
        brandName: json["brand_name"],
        servingQty: json["serving_qty"].toDouble(),
        servingUnit: json["serving_unit"],
        servingWeightGrams: json["serving_weight_grams"].toInt(),
        nfCalories: json["nf_calories"].toDouble(),
        nfTotalFat: json["nf_total_fat"].toDouble(),
        nfSaturatedFat: json["nf_saturated_fat"].toDouble(),
        nfCholesterol: json["nf_cholesterol"].toDouble(),
        nfSodium: json["nf_sodium"].toDouble(),
        nfTotalCarbohydrate: json["nf_total_carbohydrate"].toDouble(),
        nfDietaryFiber: json["nf_dietary_fiber"].toDouble(),
        nfSugars: json["nf_sugars"].toDouble(),
        nfProtein: json["nf_protein"].toDouble(),
        nfPotassium: json["nf_potassium"].toDouble(),
        nfP: json["nf_p"].toDouble(),
        fullNutrients: List<FullNutrient>.from(
            json["full_nutrients"].map((x) => FullNutrient.fromJson(x))),
        nixBrandName: json["nix_brand_name"],
        nixBrandId: json["nix_brand_id"],
        nixItemName: json["nix_item_name"],
        nixItemId: json["nix_item_id"],
        upc: json["upc"],
        consumedAt: DateTime.parse(json["consumed_at"]),
        metadata: Metadata.fromJson(json["metadata"]),
        source: json["source"],
        ndbNo: json["ndb_no"],
        tags: Tags.fromJson(json["tags"]),
        altMeasures: List<AltMeasure>.from(
            json["alt_measures"].map((x) => AltMeasure.fromJson(x))),
        lat: json["lat"],
        lng: json["lng"],
        mealType: json["meal_type"],
        photo: Photo.fromJson(json["photo"]),
        subRecipe: json["sub_recipe"],
        classCode: json["class_code"],
        brickCode: json["brick_code"],
        tagId: json["tag_id"],
      );
}

class AltMeasure {
  AltMeasure({
    @required this.servingWeight,
    @required this.measure,
    @required this.seq,
    @required this.qty,
  });

  double? servingWeight;
  String? measure;
  int? seq;
  double? qty;

  factory AltMeasure.fromRawJson(String str) =>
      AltMeasure.fromJson(json.decode(str));

  factory AltMeasure.fromJson(Map<String, dynamic> json) => AltMeasure(
        servingWeight: json["serving_weight"].toDouble(),
        measure: json["measure"],
        seq: json["seq"],
        qty: json["qty"].toDouble(),
      );
}

class FullNutrient {
  FullNutrient({
    @required this.attrId,
    @required this.value,
  });

  int? attrId;
  double? value;

  factory FullNutrient.fromRawJson(String str) =>
      FullNutrient.fromJson(json.decode(str));

  factory FullNutrient.fromJson(Map<String, dynamic> json) => FullNutrient(
        attrId: json["attr_id"],
        value: json["value"].toDouble(),
      );
}

class Metadata {
  Metadata({
    @required this.isRawFood,
  });

  bool? isRawFood;

  factory Metadata.fromRawJson(String str) =>
      Metadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        isRawFood: json["is_raw_food"],
      );

  Map<String, dynamic> toJson() => {
        "is_raw_food": isRawFood,
      };
}

class Photo {
  Photo({
    @required this.thumb,
    @required this.highres,
    @required this.isUserUploaded,
  });

  String? thumb;
  String? highres;
  bool? isUserUploaded;

  factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        thumb: json["thumb"],
        highres: json["highres"],
        isUserUploaded: json["is_user_uploaded"],
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "highres": highres,
        "is_user_uploaded": isUserUploaded,
      };
}

class Tags {
  Tags({
    @required this.item,
    @required this.measure,
    @required this.quantity,
    @required this.foodGroup,
    @required this.tagId,
  });

  String? item;
  dynamic measure;
  String? quantity;
  int? foodGroup;
  int? tagId;

  factory Tags.fromRawJson(String str) => Tags.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        item: json["item"],
        measure: json["measure"],
        quantity: json["quantity"],
        foodGroup: json["food_group"],
        tagId: json["tag_id"],
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "measure": measure,
        "quantity": quantity,
        "food_group": foodGroup,
        "tag_id": tagId,
      };
}
