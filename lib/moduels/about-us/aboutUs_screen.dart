import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset('assets/images/logo.png',
            width:MediaQuery.of(context).size.width/2 ,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Text(
                ' هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحه هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحه هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحه هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحه هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحه هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحههذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحه هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحه هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحه',
              style: TextStyle(height: 2,fontWeight: FontWeight.bold,),),
            )
          ],
        ),
      ),
    );
  }
}
