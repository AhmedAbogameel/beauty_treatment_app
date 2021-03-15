import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String message,{bool top = false}){
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: top ? ToastGravity.CENTER : ToastGravity.SNACKBAR,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
  );
}