//affichage des éléments
import 'package:flutter/cupertino.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({Key? key, required this.image, required this.title, required this.description}) : super(key: key);
  final String image, title, description ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            image,
            height: 200,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, color: Color(0xff828488), fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20,),
              Text(
                description,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
