import 'package:beauty_treatment_app/moduels/result/result_screen.dart';
import 'package:beauty_treatment_app/moduels/skin-types/controller.dart';
import 'package:beauty_treatment_app/moduels/skin-types/model.dart';
import 'package:beauty_treatment_app/shared/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SkinTypesScreen extends StatefulWidget {
  @override
  _SkinTypesScreenState createState() => _SkinTypesScreenState();
}

class _SkinTypesScreenState extends State<SkinTypesScreen> {
  SkinTypesModel _skinTypesModel;
  bool _isLoading = true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData()async{
    _skinTypesModel = await SkinTypesController().getData();
    setState(()=> _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: HexColor('#f5bebc'),
       title: Text('اختر نوع البشره',style: TextStyle(fontSize: 18),),
       centerTitle: true,
     ),
      body: _isLoading ? LoadingIndicator() : ListView.builder(
        itemCount: _skinTypesModel.categories.length,
        itemBuilder: (context, index) =>  Column(
          children: [
            SizedBox(height: 15),
            InkWell(
              onTap: ()
              {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ResultScreen( _skinTypesModel.categories[index].categoryName, _skinTypesModel.categories[index].categoryId),));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  color: HexColor('#f5bebc'),
                  child: Row(
                    children: [
                      Image.network(_skinTypesModel.categories[index].categoryImage,fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width/3,
                        height: 100,
                      ),
                      SizedBox(width: 30),
                      Text(
                          _skinTypesModel.categories[index].categoryName
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
