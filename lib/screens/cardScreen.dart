import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineshop/widgets/cardinfo.dart';

import '../widgets/cart.dart';



class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: ListView(
        children: [
          CardInfo(),
          Container(
            padding: EdgeInsets.only(top:10),
            decoration: BoxDecoration(
              color: Color.fromARGB(74, 203, 202, 197),
            ),
            child: Column(
              children: [
                CardItems(),
              ],
            ),
          )

        ],
       
      ),
    );
  }
}
