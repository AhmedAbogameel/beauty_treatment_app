import 'package:beauty_treatment_app/moduels/result/model.dart';
import 'package:beauty_treatment_app/shared/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'controller.dart';

class ResultScreen extends StatefulWidget {
  final String title;
  final String id;
  ResultScreen(this.title,this.id);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _isLoading = true;
  ResultsModel _resultsModel;

  @override
  void initState() {
    getData();
    super.initState();
  }
  getData()async{
    _resultsModel = await ResultsController().getResults(widget.id);
    setState(()=> _isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('النتيجة'),
        backgroundColor: HexColor('#f5bebc'),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _isLoading ? LoadingIndicator() : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            children: [
              Center(
                child: Image.network(_resultsModel.categoryImage,
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
                    child: Text('نوع البشره : ${_resultsModel.categoryName}'),
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
                    Text(_resultsModel.dataHabits.data,style: TextStyle(fontSize: 16,color: HexColor('#615f5f')),),
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
                    Text(_resultsModel.dataHabits.habit,style: TextStyle(fontSize: 16,color: HexColor('#615f5f')),),
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
