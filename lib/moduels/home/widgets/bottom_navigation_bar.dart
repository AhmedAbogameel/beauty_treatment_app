import 'package:beauty_treatment_app/moduels/home/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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

    );
  }
}
