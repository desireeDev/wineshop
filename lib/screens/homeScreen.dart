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
          SizedBox(
            height: 0,
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(103, 255, 255, 255),
            ),
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(168, 233, 228, 228),
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
                              // hintText: "Search",
                              icon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
//Declaration du deuxieme container
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    height: 110,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(42, 250, 189, 226),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      //margin: EdgeInsets.only(left: 5),
                      height: 59,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Customer's Choice",
                            style: GoogleFonts.gabriela(
                                color: Color.fromARGB(255, 158, 45, 83),
                                fontSize: 16),
                          ),
                          Text("Ferghettina Rose Eronero",
                              style: GoogleFonts.gabriela(
                                  color: Colors.black, fontSize: 16)),
                          Row(
                            children: [
                              Text("\$30.99",
                                  style: GoogleFonts.gabriela(
                                      color: Color.fromARGB(255, 231, 106, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              SizedBox(
                                width: 5,
                              ),
                              Text("0.2 gal"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Ideas(),
                ],
              ),
            ),
          )
        ],
      ),
      //Floatting bottom navigation bar
      bottomNavigationBar: SafeArea(
          child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 26),
        decoration: BoxDecoration(
          color:   Color(0xFF421926),
          borderRadius: BorderRadius.all(
            Radius.circular(24), // changes position of shadow
          ),
        ),
        child: Row(children: [
          SizedBox(
              width: 36,
              height: 40,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ))),
          Spacer(),
          SizedBox(
              width: 36,
              height: 40,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ))),
          Spacer(),
          SizedBox(
              width: 36,
              height: 40,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ))),
          Spacer(),
          SizedBox(
              width: 36,
              height: 40,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  )))
        ]),
      )),
    );
  }
}
