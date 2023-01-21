import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardInfo extends StatefulWidget {
  const CardInfo({Key? key}) : super(key: key);

  @override
  State<CardInfo> createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),

          Padding(padding: EdgeInsets.only(left: 100),
          child: Text("Cart",style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,  
          ),),),
          
        ],
      ),
    );
  }
}
