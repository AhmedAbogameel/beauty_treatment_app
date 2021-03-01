import 'package:beauty_treatment_app/moduels/home/cubit/cubit.dart';
import 'package:beauty_treatment_app/moduels/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor('#f5bebc'),
            title: HomeCubit.get(context).titles[HomeCubit.get(context).currentIndex],
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.asset('assets/images/logo.png',
                  width: MediaQuery.of(context).size.width/3,
                ),
                SizedBox(height: 20),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Icon(Icons.person,color: HexColor('#f5bebc'),),
                  title: Text('الحساب الشخصي'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Icon(Icons.switch_account,color: HexColor('#f5bebc'),),
                  title: Text('الحسابات'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Icon(Icons.phone_android,color: HexColor('#f5bebc'),),
                  title: Text('اتصل بنا'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Icon(Icons.info_outline_rounded,color: HexColor('#f5bebc'),),
                  title: Text(' عن التطبيق'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Icon(Icons.flaky_rounded,color: HexColor('#f5bebc'),),
                  title: Text(' الاسئله الشائعه'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Icon(Icons.logout,color: HexColor('#f5bebc'),),
                  title: Text('  تسجيل الخروج'),
                ),
              ],
            ),
          ),
          body:HomeCubit.get(context).widgets[HomeCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'الرئيسيه'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.info_outline_rounded),
                  label: 'عن التطبيق '
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.headset),
                  label: ' اتصل بنا'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: ' حسابي'
              ),
            ],
            type: BottomNavigationBarType.fixed,
            backgroundColor: HexColor('#f5bebc'),
            selectedItemColor:Colors.black,
            unselectedItemColor: Colors.white,
            currentIndex:HomeCubit.get(context).currentIndex,
            onTap: (index)
            {
              HomeCubit.get(context).changeIndex(index);
            },

          ),
        );
      },
    );
  }
}
