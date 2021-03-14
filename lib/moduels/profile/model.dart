// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.username,
    this.firstname,
    this.lastname,
    this.email,
    this.telephone,
  });

  String username;
  String firstname;
  String lastname;
  String email;
  String telephone;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    telephone: json["telephone"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "telephone": telephone,
  };
}
