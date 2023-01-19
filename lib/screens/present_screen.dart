import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wineshop/screens/home_screen.dart';

class PresentScreen extends StatefulWidget {
  const PresentScreen({Key? key}) : super(key: key);

  @override
  State<PresentScreen> createState() => _PresentScreenState();
}

class _PresentScreenState extends State<PresentScreen> {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Welcome to the World of Wine',
              body: 'Here you pick up a drink that fits all your criteria',
              image: buildImage('assets/ebook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Featured Books',
              body: 'Available right at your fingerprints',
              image: buildImage('assets/readingbook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Simple UI',
              body: 'For enhanced reading experience',
              image: buildImage('assets/manthumbs.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Today a reader, tomorrow a leader',
              body: 'Start your journey',
              footer: ElevatedButton(
                onPressed: (){
                  goToHome(context);
                },
                child: const Text(
                  'Start Reading',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              image: buildImage('assets/learn.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: ElevatedButton(
            onPressed: (){
              goToHome(context);
            },
            child: const Text(
              'Start Reading',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Skip'),
          onSkip: () => goToHome(context),
          next: ElevatedButton(
            onPressed: (){
              //goToHome(context);
            },
            child: const Text(
              'Start Reading',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Color(0xFFFFFFFF),
          dotsFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 300));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 16, color: Color(0xff828488), fontWeight: FontWeight.w500),
        bodyTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
