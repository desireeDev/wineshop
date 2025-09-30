import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineshop/screens/homeScreen.dart';

import 'linear_indicator.dart';
import 'onboard.dart';
import 'onboard_content.dart';

//Composant de l'écran d'introduction
class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  //Instanciation des éléments à afficher
  final List<Onboard> data = [
    Onboard(
        title: "Welcome to the World of Wine",
        description: "Here you pick up a drink that fits all your criteria",
        image: "assets/o1.png"),
    Onboard(
        title: "Huge selection of wines for you",
        description: "Select wines from different types, ages, countries",
        image: "assets/o2.png"),
    Onboard(
        title: "Install the wine filter quickly",
        description: "You can choose your favorite type of wine",
        image: "assets/o3.png"),
  ];
  int number = 0;

  //Passage à la HomePage
  void goToHome() {
    Get.to(() => const HomeScreen());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
    number = data.length;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                TextButton(
                    onPressed: () {
                      goToHome();
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.gabriela(
                          textStyle: const TextStyle(
                              color: Color(0xff828488),
                              fontWeight: FontWeight.w500)),
                    ))
              ],
            ),
            Expanded(
              child: PageView.builder(
                itemCount: number,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  title: data[index].title,
                  description: data[index].description,
                  image: data[index].image,
                ),
              ),
            ),
            Row(
              children: [
                ...List.generate(
                  number,
                  (index) => LinearIndicator(isActive: index == _pageIndex),
                ),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 145,
                  child: ElevatedButton(
                    onPressed: () {
                      //print("Next page $_pageIndex");
                      if (_pageIndex == 2) {
                        goToHome();
                      } else {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // <-- Radius
                    )),
                    child: Text(
                      "Next",
                      style: GoogleFonts.gabriela(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      )),
    );
  }
}
