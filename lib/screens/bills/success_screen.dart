import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineshop/screens/homeScreen.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  String image = "assets/g2.png";
  String title = "Done!";
  String description1 = "Your order is being processed.";
  String description2 = "Wait for a call from our manager.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              image,
              height: 200,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.gabriela(textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 5,),
                Text(
                  description1,
                  style: GoogleFonts.gabriela(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ),
                Text(
                  description2,
                  style: GoogleFonts.gabriela(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 55,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(
                        context, MaterialPageRoute(builder: (context) => const HomeScreen()),
                            (Route<dynamic> route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16), // <-- Radius
                        )
                    ),
                    child: Text(
                      "To Home page",
                      style: GoogleFonts.gabriela(textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
