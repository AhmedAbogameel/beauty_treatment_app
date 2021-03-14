// To parse this JSON data, do
//
//     final informationModel = informationModelFromJson(jsonString);

import 'dart:convert';

InformationModel informationModelFromJson(String str) => InformationModel.fromJson(json.decode(str));

String informationModelToJson(InformationModel data) => json.encode(data.toJson());

class InformationModel {
  InformationModel({
    this.title,
    this.description,
  });

  String title;
  String description;

  factory InformationModel.fromJson(Map<String, dynamic> json) => InformationModel(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}
