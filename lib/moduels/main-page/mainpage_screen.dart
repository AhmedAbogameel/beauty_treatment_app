import 'package:beauty_treatment_app/moduels/discover/discover_screen.dart';
import 'package:beauty_treatment_app/moduels/skin-types/skin_types_screen.dart';
import 'package:beauty_treatment_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset('assets/images/face.png',
              width: double.infinity,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Container(
                width: double.infinity,
                child: DefaultButton(
                  text: 'اختار نوع البشره',
                  function: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context) => SkinTypesScreen(),));
                  },

                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              child: DefaultButton(
                text: 'اكتشف بشرتي',
                function: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => Discover_screen(),));
                },

              ),
            ),
          ),


        ],
      ),
    );
  }
}
