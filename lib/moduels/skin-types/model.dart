// To parse this JSON data, do
//
//     final skinTypesModel = skinTypesModelFromJson(jsonString);

import 'dart:convert';

SkinTypesModel skinTypesModelFromJson(String str) => SkinTypesModel.fromJson(json.decode(str));

String skinTypesModelToJson(SkinTypesModel data) => json.encode(data.toJson());

class SkinTypesModel {
  SkinTypesModel({
    this.categories,
  });

  List<Category> categories;

  factory SkinTypesModel.fromJson(Map<String, dynamic> json) => SkinTypesModel(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
  });

  String categoryId;
  String categoryName;
  String categoryImage;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}
