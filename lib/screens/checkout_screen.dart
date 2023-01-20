import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> with TickerProviderStateMixin{
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Checkout",
            style: GoogleFonts.gabriela(),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFBBBBC0),
            ),
            child: TabBar(
              controller: _controller,

              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Creates border
                  color: const Color(0xFF421926)),
              tabs: [
                Tab(
                    child: Text(
                      "Delivery",
                      style: GoogleFonts.raleway(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFFFFFF)),
                    )),
                Tab(
                    child: Text("Pickup",
                        style: GoogleFonts.raleway(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFFFFFF)))),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: TabBarView(
              controller: _controller,
              children: [
                deliveryOpt(),
                pickupOpt(),
              ],
            ),
          ),
        ],
      ),
    );
  }


  //Widget de livraison
  Widget deliveryOpt(){
      return ListView();
  }

  //Widget de récupération
  Widget pickupOpt(){
    return ListView();
  }
}
