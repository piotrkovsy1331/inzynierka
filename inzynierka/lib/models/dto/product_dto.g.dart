// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
      productDetails: json['productDetails'] == null
          ? null
          : DetailsDto.fromJson(json['productDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'productDetails': instance.productDetails,
    };
