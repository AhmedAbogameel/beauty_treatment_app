import 'package:beauty_treatment_app/core/router.dart';
import 'package:beauty_treatment_app/core/validation.dart';
import 'package:beauty_treatment_app/moduels/reset-password/controller.dart';
import 'package:beauty_treatment_app/shared/components/loading_indicator.dart';
import 'package:beauty_treatment_app/shared/components/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _isLoading = false;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.height/1.4,
                )),
            Column(
              children: [
                Form(
                  key: key,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: 'رقم الجوال أو البريد الاكتروني',
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
                      validator: Validations.email,
                      controller: email,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                _isLoading ? LoadingIndicator() : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: double.infinity,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 2,
                      padding: EdgeInsets.all(12),
                      onPressed: ()async{
                        if(!key.currentState.validate()) return;
                        setState(()=> _isLoading = true);
                        final message = await ResetPasswordController().reset(email.text);
                        email.clear();
                        showToast(message,top: true);
                        setState(()=> _isLoading = false);
                      },
                      child: Text(
                        'استرجاع كلمه المرور',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      color: HexColor('#f5bebc'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: ()=> MagicRouter.pop(),
              child: Text('رجوع',style: TextStyle(
                  color: HexColor('#f2adab'),fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
