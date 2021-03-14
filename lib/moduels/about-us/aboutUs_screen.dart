import 'package:beauty_treatment_app/moduels/home/cubit/cubit.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final aboutUs = HomeCubit.get(context).aboutUs;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('assets/images/logo.png',
                width:MediaQuery.of(context).size.width/2 ,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(aboutUs.title,style: TextStyle(fontWeight: FontWeight.w900),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Text(
                  aboutUs.description,
                style: TextStyle(height: 2,fontWeight: FontWeight.bold,),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
