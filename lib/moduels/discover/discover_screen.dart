import 'package:beauty_treatment_app/moduels/result/result_screen.dart';
import 'package:beauty_treatment_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class Discover_screen extends StatefulWidget {
  @override
  _Discover_screenState createState() => _Discover_screenState();
}

class _Discover_screenState extends State<Discover_screen> {

  String valueChoose;
  List listItem = [
    "بشره مختلطه", "بشره جافه","بشره دهنيه","بشره عاديه"
  ];
  File _image;
  //TODO:
  List<File> images = [];
  final imagePicker = ImagePicker();

  Future getImage() async
  {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
      images.add(_image);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اكتشف بشرتي'),
        backgroundColor: HexColor('#f5bebc'),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(child: Text('رفع الصور',style: TextStyle(fontSize: 18),)),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //TODO:
                  Expanded(
                    child: MaterialButton(
                      onPressed: getImage,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      //TODO:
                      child: images.length < 1 ? Icon(Icons.camera_alt,color: Colors.white,size: 28,) : Image.file(images[0]),
                      color: HexColor('#f5bebc'),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: getImage,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: images.length < 2 ? Icon(Icons.camera_alt,color: Colors.white,size: 28,) : Image.file(images[1]),
                      color: HexColor('#f5bebc'),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: getImage,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: images.length < 3 ? Icon(Icons.camera_alt,color: Colors.white,size: 28,) : Image.file(images[2]),
                      color: HexColor('#f5bebc'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: HexColor('#ebebeb'),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: DropdownButton(
                  underline: SizedBox(),
                  isExpanded: true,
                  hint:Text(' اختر نوع بشرتك') ,
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
            SizedBox(height: 60),
            Container(
              width: double.infinity,
              child: DefaultButton(
                text: 'عرض النتيجه',
                function: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(),));
                  }

              ),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
