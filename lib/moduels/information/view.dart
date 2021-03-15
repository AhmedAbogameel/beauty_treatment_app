import 'package:beauty_treatment_app/shared/components/app_bar.dart';
import 'package:beauty_treatment_app/shared/components/loading_indicator.dart';
import 'package:flutter/material.dart';

import 'controller.dart';
import 'model.dart';

class InformationScreen extends StatefulWidget {
  final String id;
  InformationScreen(this.id);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  bool _isLoading = true;
  InformationModel _informationModel;
  getData()async{
    _informationModel = await InformationController().getInformation(widget.id);
    setState(()=> _isLoading = false);
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(_isLoading ? '' : _informationModel.title),
      body: _isLoading ? LoadingIndicator() : SingleChildScrollView(
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
                child: Text(_informationModel.title,style: TextStyle(fontWeight: FontWeight.w900),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Text(
                  _informationModel.description,
                  style: TextStyle(height: 2,fontWeight: FontWeight.bold,),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
