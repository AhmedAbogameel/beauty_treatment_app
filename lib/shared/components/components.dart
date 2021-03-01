import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget DefaultButton({
  function,
  text,
}) =>  MaterialButton(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5.0),
  ),
  elevation: 2,
  padding: EdgeInsets.all(12),
  onPressed:function,
  child: Text(text,
    style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700),
  ),
  color: HexColor('#f5bebc'),
);

