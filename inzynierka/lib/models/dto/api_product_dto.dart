// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:inzynierka/models/api_product.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class ApiProductDto {
  ApiProductDto({
    this.common = const [],
    this.branded = const [],
  });

  List<Common> common;
  List<Branded> branded;

  factory ApiProductDto.fromRawJson(String str) =>
      ApiProductDto.fromJson(json.decode(str));

  factory ApiProductDto.fromJson(Map<String, dynamic> json) => ApiProductDto(
        common:
            List<Common>.from(json["common"].map((x) => Common.fromJson(x))),
        branded:
            List<Branded>.from(json["branded"].map((x) => Branded.fromJson(x))),
      );

  List<ApiProduct> toApiProductsList() {
    List<ApiProduct> _returnArray = [];
    for (Common _common in common) {
      _returnArray.add(_common.toModel());
    }
    for (Branded _branded in branded) {
      _returnArray.add(_branded.toModel());
    }

    return _returnArray;
  }
}

class Branded {
  Branded({
    @required this.foodName,
    @required this.servingUnit,
    @required this.nixBrandId,
    @required this.brandNameItemName,
    @required this.servingQty,
    @required this.nfCalories,
    @required this.photo,
    @required this.brandName,
    @required this.region,
    @required this.brandType,
    @required this.nixItemId,
    @required this.locale,
  });

  String? foodName;
  String? servingUnit;
  String? nixBrandId;
  String? brandNameItemName;
  double? servingQty;
  double? nfCalories;
  Photo? photo;
  String? brandName;
  int? region;
  int? brandType;
  String? nixItemId;
  Locale? locale;

  factory Branded.fromRawJson(String str) => Branded.fromJson(json.decode(str));

  factory Branded.fromJson(Map<String, dynamic> json) => Branded(
        foodName: json["food_name"],
        servingUnit: json["serving_unit"],
        nixBrandId: json["nix_brand_id"],
        brandNameItemName: json["brand_name_item_name"],
        servingQty: json["serving_qty"].toDouble(),
        nfCalories: json["nf_calories"].toDouble(),
        photo: Photo.fromJson(json["photo"]),
        brandName: json["brand_name"],
        region: json["region"],
        brandType: json["brand_type"],
        nixItemId: json["nix_item_id"],
        locale: localeValues.map[json["locale"]],
      );

  ApiProduct toModel() => ApiProduct(
      foodName: foodName,
      servingQty: servingQty,
      photo: photo != null ? photo!.thumb : '');
}

enum Locale { EN_US }

final localeValues = EnumValues({"en_US": Locale.EN_US});

class Photo {
  Photo({
    @required this.thumb,
    @required this.highres,
    @required this.isUserUploaded,
  });

  String? thumb;
  dynamic highres;
  bool? isUserUploaded;

  factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        thumb: json["thumb"],
        highres: json["highres"],
        isUserUploaded:
            json["is_user_uploaded"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "highres": highres,
        "is_user_uploaded": isUserUploaded ?? null,
      };
}

class Common {
  Common({
    @required this.foodName,
    @required this.servingUnit,
    @required this.tagName,
    @required this.servingQty,
    @required this.commonType,
    @required this.tagId,
    @required this.photo,
    @required this.locale,
  });

  String? foodName;
  String? servingUnit;
  String? tagName;
  double? servingQty;
  dynamic commonType;
  String? tagId;
  Photo? photo;
  Locale? locale;

  factory Common.fromRawJson(String str) => Common.fromJson(json.decode(str));

  factory Common.fromJson(Map<String, dynamic> json) => Common(
        foodName: json["food_name"],
        servingUnit: json["serving_unit"],
        tagName: json["tag_name"],
        servingQty: json["serving_qty"].toDouble(),
        commonType: json["common_type"],
        tagId: json["tag_id"],
        photo: Photo.fromJson(json["photo"]),
        locale: localeValues.map[json["locale"]],
      );

  ApiProduct toModel() => ApiProduct(
      foodName: foodName,
      servingQty: servingQty,
      photo: photo != null ? photo!.thumb : '');
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
