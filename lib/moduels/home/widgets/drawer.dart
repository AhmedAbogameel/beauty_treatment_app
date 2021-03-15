import 'package:beauty_treatment_app/core/router.dart';
import 'package:beauty_treatment_app/core/shared_helper.dart';
import 'package:beauty_treatment_app/moduels/home/cubit/cubit.dart';
import 'package:beauty_treatment_app/moduels/information/view.dart';
import 'package:beauty_treatment_app/moduels/intro/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 20),
          Image.asset('assets/images/logo.png',
            width: MediaQuery.of(context).size.width/3,
          ),
          SizedBox(height: 20),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            leading: Icon(Icons.home,color: HexColor('#f5bebc'),),
            title: Text('الرئيسية'),
            onTap: (){
              Navigator.pop(context);
              HomeCubit.get(context).changeIndex(0);
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            leading: Icon(Icons.person,color: HexColor('#f5bebc'),),
            title: Text('الحساب الشخصي'),
            onTap: (){
              Navigator.pop(context);
              HomeCubit.get(context).changeIndex(3);
            },
          ),
          // ListTile(
          //   contentPadding: EdgeInsets.symmetric(horizontal: 10),
          //   leading: Icon(Icons.switch_account,color: HexColor('#f5bebc'),),
          //   title: Text('الحسابات'),
          // ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            leading: Icon(Icons.phone_android,color: HexColor('#f5bebc'),),
            title: Text('اتصل بنا'),
            onTap: (){
              Navigator.pop(context);
              HomeCubit.get(context).changeIndex(2);
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            leading: Icon(Icons.info_outline_rounded,color: HexColor('#f5bebc'),),
            title: Text(' عن التطبيق'),
            onTap: (){
              Navigator.pop(context);
              HomeCubit.get(context).changeIndex(1);
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            leading: Icon(Icons.block,color: HexColor('#f5bebc'),),
            title: Text('سياسة الاستخدام'),
            onTap: ()=> MagicRouter.navigateTo(InformationScreen('3')),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            leading: Icon(Icons.question_answer_outlined,color: HexColor('#f5bebc'),),
            title: Text('الاسئلة الشائعة'),
            onTap: ()=> MagicRouter.navigateTo(InformationScreen('5')),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            leading: Icon(Icons.logout,color: HexColor('#f5bebc'),),
            title: Text('  تسجيل الخروج'),
            onTap: (){
              SharedHelper.clear();
              MagicRouter.navigateAndPopAll(introScreen());
            },
          ),
        ],
      ),
    );
  }
}
