import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        elevation: 0,
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(
            "Checkout",
            style: GoogleFonts.gabriela(textStyle: const TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.bold,
              fontSize: 26
            )),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_sharp,color: Color(0xff000000),)),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30,bottom: 0.0),
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFEBEBEF),
            ),
            child: TabBar(
              controller: _controller,
              labelColor: const Color(0xFFECE0E7),
              unselectedLabelColor: const Color(0xFF000000),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Creates border
                  color: const Color(0xFF421926)),
              tabs: [
                Tab(
                    child: Text(
                      "Delivery",
                      style: GoogleFonts.gabriela(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          //color: const Color(0xFFFFFFFF)
                      ),
                    )
                ),
                Tab(
                    child: Text("Pickup",
                        style: GoogleFonts.gabriela(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            //color: const Color(0xFFFFFFFF)
                        )
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            height: 800,
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
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(FontAwesomeIcons.clock,
                          color: Color(0xFF421926)),
                      const Icon(
                          Icons.access_time,
                        color: Color(0xFF421926),
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        "30-40 min",
                        style: GoogleFonts.gabriela(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Divider(),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Color(0xFF421926),
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        "2342 W Cullerton St",
                        style: GoogleFonts.gabriela(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: (){
                            print("Choisir un emplacement");
                          },
                          icon: const Icon(Icons.arrow_forward_ios_outlined,color: Color(0xff828488),)
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: 400,
                    height: 250,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xFFEBEBEF),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Center(child: Text("Page de livraison")),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Text(
                        "Total Price",
                        style: GoogleFonts.gabriela(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.attach_money_rounded,
                        size: 18,
                      ),
                      Text(
                        "494.95",
                        style: GoogleFonts.gabriela(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50,),
                  SizedBox(
                    height: 55,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: (){
                        print("Next page");

                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16), // <-- Radius
                          )
                      ),
                      child: Text(
                        "Proceed to Payments",
                        style: GoogleFonts.gabriela(textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
  }

  //Widget de récupération
  Widget pickupOpt(){
    return ListView(
      children: [
        Container(
          child: Column(
            children: [
              Center(child: Text("Page de quitance"))
            ],
          ),
        )
      ],
    );
  }
}
