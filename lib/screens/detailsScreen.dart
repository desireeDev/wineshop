import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cardScreen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;
  var nbre = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
              color: Colors.black,
              icon: isFavorite
                  ? Icon(Icons.airplanemode_on_outlined)
                  : Icon(Icons.favorite),
              onPressed: () {
                isFavorite = !isFavorite;
                setState(() {});
              })
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
              SizedBox(
                height: 500,
                width: 500,
                child: ListView(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Domaine Carneros",
                                  style: GoogleFonts.gabriela(
                                      fontSize: 20, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Le Reve Blanc",
                                  style: GoogleFonts.gabriela(
                                      fontSize: 20, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Year",
                                  style: GoogleFonts.gabriela(
                                      fontSize: 15, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "2014",
                                  style: GoogleFonts.gabriela(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Country",
                                  style: GoogleFonts.gabriela(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "French",
                                  style: GoogleFonts.gabriela(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Type",
                                  style: GoogleFonts.gabriela(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "White Dry",
                                  style: GoogleFonts.gabriela(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "\$109.99",
                                      style: GoogleFonts.gabriela(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "0.2 gal",
                                      style: GoogleFonts.gabriela(
                                        fontSize: 10,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  child: Image.asset("assets/images/bella.jpg"),
                                  width: 170,
                                  height: 200,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: GoogleFonts.gabriela(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                  "A deluge of rain in February meant we entered the growing season with satured soils and a full water table"),
                              height: 100,
                              width: 400,
                            ),
                            Text("Nutritional values",style:GoogleFonts.gabriela(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),),
                            Row(
                              children: [
                                
                                Text("Sugar",style:GoogleFonts.gabriela(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),),
                                Text("5g/0.03gal"),
                                Text("Calories",style: GoogleFonts.gabriela(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),),
                                Text("23kcal/0.03gal"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(CupertinoIcons.minus)),
                    Text("$nbre"),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(CupertinoIcons.add),
                    Spacer(),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                          onPressed: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => CardScreen())));
                          }),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                Color(0xFF421926),
                              )),
                          child: Text(
                            "Add to cart",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
