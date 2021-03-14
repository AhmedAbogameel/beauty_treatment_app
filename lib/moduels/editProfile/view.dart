import 'package:beauty_treatment_app/constants.dart';
import 'package:beauty_treatment_app/core/router.dart';
import 'package:beauty_treatment_app/core/validation.dart';
import 'package:beauty_treatment_app/moduels/editProfile/controller.dart';
import 'package:beauty_treatment_app/moduels/home/homepage_screen.dart';
import 'package:beauty_treatment_app/shared/components/app_bar.dart';
import 'package:beauty_treatment_app/shared/components/components.dart';
import 'package:beauty_treatment_app/shared/components/loading_indicator.dart';
import 'package:beauty_treatment_app/shared/components/toast.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class EditProfileView extends StatefulWidget {
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool _isLoading = false;
  TextEditingController firstName = TextEditingController(text: currentLoggedUser.firstName);
  TextEditingController lastName = TextEditingController(text: currentLoggedUser.lastName);
  TextEditingController phoneNumber = TextEditingController(text: currentLoggedUser.phoneNumber);
  TextEditingController email = TextEditingController(text: currentLoggedUser.email);
  final sizedBox = SizedBox(height: 20,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('تعديل الملف الشخصي'),
      body: Form(
        key: key,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            sizedBox,
            TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'البريد الاكتروني',
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
            sizedBox,
            TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'رقم الجوال',
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
              controller: phoneNumber,
            ),
            sizedBox,
            TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'الاسم الاول',
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
              controller: firstName,
            ),
            sizedBox,
            TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'الاسم الاخير',
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
              controller: lastName,
            ),
            sizedBox,
            _isLoading ? LoadingIndicator() : DefaultButton(
              text: 'تعديل',
              function: ()async{
                setState(()=> _isLoading = true);
                final message = await EditProfileController().edit(
                  phoneNumber: phoneNumber.text,
                  email: email.text,
                  firstName: firstName.text,
                  lastName: lastName.text
                );
                showToast(message);
                MagicRouter.navigateAndPopAll(HomePageScreen());
                setState(()=> _isLoading = false);
              }
            ),
          ],
        ),
      ),
    );
  }
}
