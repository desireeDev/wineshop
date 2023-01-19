
import 'package:flutter/cupertino.dart';

//Avancement du défilement
class LinearIndicator extends StatelessWidget {
  const LinearIndicator({Key? key, this.isActive = false}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: isActive ? 20 : 15,
      decoration: const BoxDecoration(
          color: Color(0xFF421926),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
    );
  }
}