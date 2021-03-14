import 'package:beauty_treatment_app/constants.dart';
import 'package:beauty_treatment_app/core/validation.dart';
import 'package:beauty_treatment_app/moduels/contact-us/controller.dart';
import 'package:beauty_treatment_app/shared/components/components.dart';
import 'package:beauty_treatment_app/shared/components/loading_indicator.dart';
import 'package:beauty_treatment_app/shared/components/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  // List listItem = [
  //   "اتصال", "اقتراح","مشكله"
  // ];
  bool _isLoading = false;
  TextEditingController messageController = TextEditingController();
  TextEditingController nameController = TextEditingController(text: currentLoggedUser.fullName);
  TextEditingController phoneController = TextEditingController(text: currentLoggedUser.phoneNumber);
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('الاسم'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    controller: nameController,
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
                    validator: Validations.name,
                  ),
                ),
                Text('الجوال'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                  child: TextFormField(
                    controller: phoneController,
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
                    validator: Validations.phone,
                  ),
                ),
                SizedBox(height: 10),
                Text(' الرساله'),
                SizedBox(height: 10),
                TextFormField(
                  maxLines: 5,
                  controller: messageController,
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
                  validator: (v){
                    if(v.isEmpty) return 'حقل فارغ!';
                    else if(v.length < 10) return 'يجب ان تكون الرسالة اكبر من 9 احرف';
                    else return null;
                  },
                ),
                SizedBox(height: 10),
                _isLoading ? LoadingIndicator() : Container(
                  width: double.infinity,
                  child: DefaultButton(
                      text:'ارسال',
                    function: ()async{
                       if(!key.currentState.validate()) return;
                       setState(()=> _isLoading = true);
                       final message = await ContactUsController().send(nameController.text, phoneController.text, messageController.text);
                       showToast(message);
                       messageController.clear();
                       setState(()=> _isLoading = false);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}

/*
 // Text('نوع الاستفسار'),
              // SizedBox(height: 10),
              // Container(
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: HexColor('#ebebeb'),
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 10),
              //     child: DropdownButton(
              //         underline: SizedBox(),
              //         isExpanded: true,
              //         hint:Text(' مشكله أو اقتراح أو اتصال ؟') ,
              //         dropdownColor:HexColor('#ebebeb'),
              //         icon: Icon(Icons.arrow_drop_down),
              //         iconSize: 28,
              //         value: valueChoose,
              //         onChanged: (newvalue)
              //         {
              //           setState(() {
              //             valueChoose = newvalue;
              //           });
              //         },
              //         items: listItem.map((valueItem)
              //         {
              //           return DropdownMenuItem(
              //             value: valueItem,
              //             child: Text(valueItem),
              //           );
              //         }).toList()
              //     ),
              //   ),
              // ),
 */