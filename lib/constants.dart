import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'core/user_singleton.dart';
import 'shared/components/toast.dart';

const String BASE_URL = 'https://web2html5.com/m/beautytreatment/index.php?route=';

Dio dio = Dio()..options.baseUrl = BASE_URL;

UserSingleton currentLoggedUser = UserSingleton();

const String DefaultErrorMessage = 'حدث خطأ أثناء تنفيذ طلبكم!';

FormData mapToFormData(Map<String,dynamic> data)=> FormData.fromMap(data);

void showDefaultErrorMessage ()=> showToast(DefaultErrorMessage);

void closeKeyboard(context)=> FocusScope.of(context).unfocus();

double sizeFromHeight(BuildContext context, double fraction, {bool removeAppBarSize = true}) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  fraction = (removeAppBarSize
      ? (mediaQuery.size.height - AppBar().preferredSize.height - mediaQuery.padding.top)
      : mediaQuery.size.height) / (fraction == 0 ? 1 : fraction);
  return fraction;
}

double sizeFromWidth(BuildContext context, double fraction) {
  fraction = MediaQuery.of(context).size.width / (fraction == 0 ? 1 : fraction);
  return fraction;
}