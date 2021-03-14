import 'package:flutter/material.dart';
import 'shared_helper.dart';

class UserSingleton {
  String fullName;
  String userName;
  String firstName;
  String lastName;
  String phoneNumber;
  // String image;
  String email;
  int id;
  String get auth => 'logged';
  String get apiToken => 'D25UoqdjYuCqGsRiTf8L61VYIdrSzdc0u4GjX4d4BwAy7KllSbTEJY3f2OoJfQcGkG5wKC1c7Bw4KkeggtzNMP2B6BjAit4JYOcUNoQF0n0p7amPBWLY2kwPtKdg6QEPVyYCHfdHhpCn02ocyuVliNMzmL5vnIiR40OX2xLv5l1Og1u0IazEJ3beZG3tD8d22d3lZvWnDbGmCPfPlvwkmbD85rnFX1Dw3SMxXw7QCULtQnLXxvl2SNXLEp0TqqlQ';
  bool isLogged = false;

  factory UserSingleton()=> _userSingleton;

  UserSingleton._();
  static UserSingleton _userSingleton = UserSingleton._();

  Future<void> setUser({
    @required String firstName,
    @required String lastName,
    @required String phoneNumber,
    @required String userName,
    // @required String image,
    @required String email,
    @required int id,
    bool isLogged = false,
  })async{
    this.fullName = firstName + ' ' + lastName;
    this.firstName = firstName;
    this.lastName = lastName;
    this.phoneNumber = phoneNumber;
    // this.image = image;
    this.email = email;
    this.id = id;
    this.userName = userName;
    this.isLogged = isLogged;
    await SharedHelper.cacheUser();
  }
}