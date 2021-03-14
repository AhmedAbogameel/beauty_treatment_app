import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String upperText;
  final String title;
  InfoCard({this.title,this.upperText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(upperText != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(upperText,style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(title,style: TextStyle(color: Colors.black54),),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5
                )
              ],
              // border: Border.all(color: Colors.black12.withOpacity(0.1))
            ),
          ),
        ],
      ),
    );
  }
}
