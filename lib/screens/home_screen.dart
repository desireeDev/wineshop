import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineshop/screens/bills/checkout_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Bienvenue",
              style: GoogleFonts.gabriela(),
            ),
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckOutScreen()));
                },
                icon: const Icon(Icons.arrow_forward)
            )
          ],
        ),
      ),
    );
  }
}
