import 'package:beauty_treatment_app/constants.dart';
import 'package:beauty_treatment_app/core/router.dart';
import 'package:beauty_treatment_app/moduels/editProfile/view.dart';
import 'package:beauty_treatment_app/moduels/profile/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit,color: Colors.black,),
        backgroundColor: HexColor('#f5bebc'),
        onPressed: ()=> MagicRouter.navigateTo(EditProfileView()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InfoCard(
              upperText: 'اسم المستخدم',
              title: currentLoggedUser.userName,
            ),
            InfoCard(
              upperText: 'الاسم الاول',
              title: currentLoggedUser.firstName,
            ),
            InfoCard(
              upperText: 'الاسم الاخير',
              title: currentLoggedUser.lastName,
            ),
            InfoCard(
              upperText: 'البريد الالكتروني',
              title: currentLoggedUser.email,
            ),
            InfoCard(
              upperText: 'رقم الجوال',
              title: currentLoggedUser.phoneNumber,
            ),
          ],
        ),
      ),
    );
  }
}
