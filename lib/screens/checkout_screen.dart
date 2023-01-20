import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineshop/screens/payment_screen.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> with TickerProviderStateMixin{
  late TabController _controller;
  TextEditingController lieuController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

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
            icon: const Icon(FontAwesomeIcons.arrowLeft,color: Color(0xff000000),)),
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
          Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 560,
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      deliveryOpt(),
                      pickupOpt(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: (){
                          if(_formkey.currentState!.validate()){
                            //print("Next page");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentScreen()));
                          }else{
                            print("Information incomplète");
                          }
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
                      const SizedBox(width: 15,),
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
                        FontAwesomeIcons.locationDot,
                        color: Color(0xFF421926),
                      ),
                      const SizedBox(width: 15,),
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
                          icon: const Icon(FontAwesomeIcons.chevronRight,color: Color(0xff828488),)
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
                  lieuTextField(),
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
                        FontAwesomeIcons.dollarSign,
                        size: 16,
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
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(FontAwesomeIcons.clock,
                        color: Color(0xFF421926)),
                    const SizedBox(width: 15,),
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
                      FontAwesomeIcons.locationDot,
                      color: Color(0xFF421926),
                    ),
                    const SizedBox(width: 15,),
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
                        icon: const Icon(FontAwesomeIcons.chevronRight,color: Color(0xff828488),)
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
                lieuTextField(),
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
                      FontAwesomeIcons.dollarSign,
                      size: 16,
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
              ],
            ),
          ),
        )
      ],
    );
  }

  //Widget saisie d'adresse
  Widget lieuTextField(){
    return TextFormField(
      style: GoogleFonts.gabriela(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF989898)
      ),
      controller: lieuController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Indiquez votre lieu d\'habitation';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF6F2F2),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide.none
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide.none
        ),
        hintText: "Apartment number, floor, office",
        hintStyle: GoogleFonts.gabriela(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF989898)
        ),
        errorStyle: GoogleFonts.gabriela(),
      ),
    );
  }
}
