// To parse this JSON data, do
//
//     final resultsModel = resultsModelFromJson(jsonString);

import 'dart:convert';

ResultsModel resultsModelFromJson(String str) => ResultsModel.fromJson(json.decode(str));

String resultsModelToJson(ResultsModel data) => json.encode(data.toJson());

class ResultsModel {
  ResultsModel({
    this.categoryName,
    this.categoryImage,
    this.dataHabits,
  });

  String categoryName;
  String categoryImage;
  DataHabits dataHabits;

  factory ResultsModel.fromJson(Map<String, dynamic> json) => ResultsModel(
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
    dataHabits: DataHabits.fromJson(json["data_habits"]),
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "category_image": categoryImage,
    "data_habits": dataHabits.toJson(),
  };
}

class DataHabits {
  DataHabits({
    this.data,
    this.habit,
  });

  String data;
  String habit;

  factory DataHabits.fromJson(Map<String, dynamic> json) => DataHabits(
    data: json["data"],
    habit: json["habit"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "habit": habit,
  };
}
