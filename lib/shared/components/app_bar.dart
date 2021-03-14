import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

appBar(String title)=> AppBar(
  backgroundColor: HexColor('#f5bebc'),
  title: Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,height: 2),),
  centerTitle: true,
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
);