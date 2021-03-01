import 'package:beauty_treatment_app/moduels/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SkinTypesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: HexColor('#f5bebc'),
       title: Text('اختر نوع البشره',style: TextStyle(fontSize: 18),),
       centerTitle: true,
     ),
      body:Column(
        children: [
          SizedBox(height: 15),
          InkWell(
            onTap: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => ResultScreen(),));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
              child: Container(
                width: double.infinity,
                height: 100.0,
                color: HexColor('#f5bebc'),
                child: Row(
                  children: [
                    Image.asset('assets/images/face-1.png',fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width/3,
                      height: 100,
                    ),
                    SizedBox(width: 30),
                    Text(
                        'بشره عاديه'
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => ResultScreen(),));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Container(
                width: double.infinity,
                color: HexColor('#ffdddc'),
                child: Row(
                  children: [
                    Image.asset('assets/images/face-2.png',fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width/3,
                      height: 100,
                    ),
                    SizedBox(width: 30),
                    Text(
                        'بشره دهنيه'
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => ResultScreen(),));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
              child: Container(
                width: double.infinity,
                height: 100.0,
                color: HexColor('#f5bebc'),
                child: Row(
                  children: [
                    Image.asset('assets/images/face-3.png',fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width/3,
                      height: 100,
                    ),
                    SizedBox(width: 30),
                    Text(
                        'بشره مختلطه'
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell (
            onTap: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => ResultScreen(),));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Container(
                width: double.infinity,
                height: 100.0,
                color: HexColor('#ffdddc'),
                child: Row(
                  children: [
                    Image.asset('assets/images/face-4.png',fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width/3,
                      height: 100,
                    ),
                    SizedBox(width: 30),
                    Text(
                        'بشره جافه'
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
