import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Appbar extends StatefulWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding:EdgeInsets.symmetric(vertical: 20,) ,
      child: Row(
        children: [
          Padding (
            padding: EdgeInsets.only(left: 20),
            child:Text("What  Would  you like? ",
            style: GoogleFonts.adamina(
                  fontSize: 20,
                  color: Color.fromARGB(255, 1, 16, 19),
                  fontWeight: FontWeight.bold)
            ) ,
          ),
          SizedBox(
            width:15 ,
          )
        ],
      ),


    
    );
  }
}
