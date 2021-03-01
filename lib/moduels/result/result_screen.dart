import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('النتيجه'),
        backgroundColor: HexColor('#f5bebc'),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            children: [
              Center(
                child: Image.asset('assets/images/res.png',
                width: 100,
                  height: 100,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: HexColor('#ebebeb'),
                    borderRadius: BorderRadius.circular(5)
                ),
                width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                    child: Text('نوع البشره : بشره دهنيه'),
                  )),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: HexColor('#ebebeb'),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text('استخدام البيانات التي تحتوي علي ')),
                    SizedBox(height: 10),
                    Text('نياسيناميد',style: TextStyle(fontSize: 16,color: HexColor('#615f5f')),),
                    SizedBox(height: 5),
                    Text('هالورونيك اسيد',style: TextStyle(fontSize: 16,color: HexColor('#615f5f')),),
                    SizedBox(height: 5),
                    Text('الزنك',style: TextStyle(fontSize: 16,color: HexColor('#615f5f')),),
                    SizedBox(height: 5),
                    Text('بينزول بروكسيد',style: TextStyle(fontSize: 16,color: HexColor('#615f5f')),),
                    SizedBox(height: 5),
                    Text('الريتنزول',style: TextStyle(fontSize: 16,color: HexColor('#615f5f')),),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: HexColor('#f5bebc'),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text('عادات يوميه لبشره مشرقه ')),
                    SizedBox(height: 10),
                    Text('شرب عن مالايقل عن 2 لتر من الماء',style: TextStyle(fontSize: 16,color: HexColor('#615f5f')),),
                    SizedBox(height: 5),
                    Text(' ممارسه التمارين الرياضية',style: TextStyle(fontSize: 16,color: HexColor('#615f5f')),),
                    SizedBox(height: 5),
                    Text('تناول افطار غنى بالبروتين',style: TextStyle(fontSize: 16,color: HexColor('#615f5f')),),
                    SizedBox(height: 5),
                    Text('تناول فاكهه يويما',style: TextStyle(fontSize: 16,color: HexColor('#615f5f')),),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
