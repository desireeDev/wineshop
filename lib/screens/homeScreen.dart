import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineshop/widgets/ideas.dart';

import '../widgets/appbar.dart';
import 'cardScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = [
    "Red",
    "White",
    "Rose",
    "Sparkling",
    "Fortified",
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    //double MyHeight = MediaQuery.of(context).size.height;
    // double MyWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          const Appbar(),
          const SizedBox(
            height: 0,
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(103, 255, 255, 255),
            ),
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(168, 233, 228, 228),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          height: 59,
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle: GoogleFonts.gabriela(),
                              icon: const Icon(Icons.search),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
//Declaration du deuxieme container
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    height: 110,
                    width: 400,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(42, 250, 189, 226),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SizedBox(
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
                                color: const Color.fromARGB(255, 158, 45, 83),
                                fontSize: 16),
                          ),
                          Text("Ferghettina Rose Eronero",
                              style: GoogleFonts.gabriela(
                                  color: Colors.black, fontSize: 16)),
                          Row(
                            children: [
                              Text("\$30.99",
                                  style: GoogleFonts.gabriela(
                                      color: const Color.fromARGB(255, 231, 106, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(" /0.2 gal",
                                  style: GoogleFonts.gabriela(
                                      color: const Color.fromARGB(
                                          255, 159, 159, 159),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: items.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          current = index;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                        const Duration(milliseconds: 300),
                                        margin: const EdgeInsets.all(5),
                                        width: 80,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: current == index
                                              ? Colors.white70
                                              : Colors.white54,
                                          borderRadius: current == index
                                              ? BorderRadius.circular(15)
                                              : BorderRadius.circular(10),
                                          border: current == index
                                              ? Border.all(
                                              color: Color.fromARGB(
                                                  255, 246, 244, 249),
                                              width: 2)
                                              : null,
                                        ),
                                        child: Center(
                                          child: Text(
                                            items[index],
                                            style: GoogleFonts.laila(
                                                fontWeight: FontWeight.w500,
                                                color: current == index
                                                    ? Colors.black
                                                    : Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                        visible: current == index,
                                        child: Container(
                                          width: 5,
                                          height: 5,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 230, 229, 232),
                                              shape: BoxShape.circle),
                                        ))
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),



                  const Ideas(),
                ],
              ),
            ),
          )
        ],
      ),
      //Floatting bottom navigation bar
      bottomNavigationBar: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 26),
        decoration: const BoxDecoration(
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
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const HomeScreen())));

                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ))),
          const Spacer(),
          SizedBox(
              width: 36,
              height: 40,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const CardScreen())));

                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ))),
          const Spacer(),
          SizedBox(
              width: 36,
              height: 40,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const CardScreen())));

                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ))),
          const Spacer(),
          SizedBox(
              width: 36,
              height: 40,
              child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const HomeScreen())));

                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  )))
        ]),
      )),
    );
  }
}
