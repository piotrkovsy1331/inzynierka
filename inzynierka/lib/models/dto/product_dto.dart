import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inzynierka/models/details.dart';
import 'package:inzynierka/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

import 'details_dto.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  ProductDto({
    required this.name,
    required this.photoUrl,
    required this.productDetails,
  });
  String? name;
  String? photoUrl;
  DetailsDto? productDetails;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

  Product toModel() {
    return Product(
        name: name ?? "",
        productDetails: productDetails != null
            ? productDetails!.toModel()
            : Details(calories: 0, fat: 0, protein: 0, sugar: 0, weight: 0));
  }

  static ProductDto fromModel(Product product) {
    return ProductDto(
        name: product.name,
        photoUrl: product.photoUrl,
        productDetails: DetailsDto.fromModel(product.productDetails));
  }

  static ProductDto fromDocumentSnapshot(DocumentSnapshot doc) {
    return ProductDto(
        name: doc['name'],
        photoUrl: doc['photoUrl'],
        productDetails: DetailsDto.fromDocumentSnapshot(doc['productDetails']));
  }
}
