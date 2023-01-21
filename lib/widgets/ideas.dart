import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineshop/screens/detailsScreen.dart';

class Ideas extends StatefulWidget {
  const Ideas({Key? key}) : super(key: key);

  @override
  State<Ideas> createState() => _IdeasState();
}

class _IdeasState extends State<Ideas> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.8,
      crossAxisCount: 2,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 5; i++)
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder:((context) =>DetailsScreen())));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/bella.jpg",
                      height: 140,
                      width: 140,
                    ),
                  ),
                ),
//Description sur le produit
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Domaine Carneros",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ),
                //Prix du produit
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "\$120",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.add_circled_solid,
                          
                          )
                      ]),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
