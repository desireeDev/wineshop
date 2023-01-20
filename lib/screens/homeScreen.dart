import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineshop/widgets/ideas.dart';

import '../widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //double MyHeight = MediaQuery.of(context).size.height;
    // double MyWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Appbar(),
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(103, 255, 255, 255),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(130, 183, 36, 36),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 59,
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                          ),
                        ),
                      ),   
                    ],   
                  ),
                ),
//Declaration du deuxieme container
            Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  height: 130,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(130, 183, 36, 36),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 59,
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "ESsai",
                          ),
                        ),
                      ), 
                    ],
                  ),
                ),
                Ideas(),
              ],
            ),
           
          )     
        ],
      ),
    
    );
  }
}
