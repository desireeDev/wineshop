import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardItems extends StatefulWidget {
  const CardItems({Key? key}) : super(key: key);

  @override
  State<CardItems> createState() => _CardItemsState();
}

class _CardItemsState extends State<CardItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i < 5; i++)
          Container(
            height: 90,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(0)),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(right: 15),
                  child: Image.asset("assets/images/bella.jpg"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Domaine Carneros Le Reve",
                          style: TextStyle(
                              fontSize: 20),
                        ),
                      ),
                      Text(
                        "Blanc 2014",
                        style: TextStyle(
                            fontSize: 17),
                      ),
                      Text(
                        "\$219.98",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 2, 2)),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(CupertinoIcons.minus, color: Colors.black, size: 18),
                      Icon(CupertinoIcons.add, color: Colors.black, size: 18)
                    ],
                  ),
                )
              ],
            ),
          ),
//Second container
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text("Total Price",style:GoogleFonts.gabriela(
                      fontSize: 20,
                    ) ,),
                    Spacer(),
                    Text("\$494.95",style:GoogleFonts.gabriela(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ))
                  ],
                ),
             Padding(
               padding: const EdgeInsets.all(70),
               child: Row(
                    children: [
                      SizedBox(
                        height:50 ,
                        width:200 ,
                        child: ElevatedButton(
                            onPressed: (() {
                            //Navigator.push(context,MaterialPageRoute(builder: ((context) => CardScreen())));
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
                              "Proceed to checkout",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      )
                    ],
                  ),
             ),
              ],
            ),
          ),
        ),
        
                
                 
              
      ],
    );
  }
}
