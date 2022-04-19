import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inzynierka/models/details.dart';
import 'package:inzynierka/models/product.dart';
import 'details_dto.dart';


class ProductDto {
  String? name;
  String? photoUrl;
  DetailsDto? productDetails;
  ProductDto({
    required this.name,
    required this.photoUrl,
    required this.productDetails,
  });

  ProductDto.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        photoUrl = json['photoUrl'] as String?,
        productDetails = json['productDetails'] == null
            ? null
            : DetailsDto.fromJson(
                json['productDetails'] as Map<String, dynamic>);

  Map<String, dynamic> toJson() {
    Map<String, dynamic>? productDetails =
        this.productDetails != null ? this.productDetails!.toJson() : null;
    return {
      'name': name,
      'photoUrl': photoUrl,
      'productDetails': productDetails,
    };
  }

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
