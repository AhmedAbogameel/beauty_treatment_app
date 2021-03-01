import 'package:beauty_treatment_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  String valueChoose;
  List listItem = [
    "اتصال", "اقتراح","مشكله"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('الاسم'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    fillColor: HexColor('#ebebeb'),
                    filled: true,
                  ),
                ),
              ),
              Text('الجوال'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    fillColor: HexColor('#ebebeb'),
                    filled: true,
                  ),
                ),
              ),
              Text('نوع الاستفسار'),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: HexColor('#ebebeb'),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton(
                      underline: SizedBox(),
                      isExpanded: true,
                      hint:Text(' مشكله أو اقتراح أو اتصال ؟') ,
                      dropdownColor:HexColor('#ebebeb'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 28,
                      value: valueChoose,
                      onChanged: (newvalue)
                      {
                        setState(() {
                          valueChoose = newvalue;
                        });
                      },
                      items: listItem.map((valueItem)
                      {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList()
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(' الرساله'),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 5,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                  fillColor: HexColor('#ebebeb'),
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: DefaultButton(
                    text:'ارسال',
                  function: (){},
                ),
              )


            ],
          ),
        ),
      ),

    );
  }
}
