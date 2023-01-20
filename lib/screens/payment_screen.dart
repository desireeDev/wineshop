import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineshop/screens/success_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController lieuController = TextEditingController();
  TextEditingController creditController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController postController = TextEditingController();
  final _formcreditkey = GlobalKey<FormState>();


  String ? dropdownValue = 'Choisissez...';
  static const List<String> pays = <String>['Choisissez...','United States', 'Côte d\'Ivoire'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    creditController.text = "4587 9856 7454 5146";
    cvvController.text = "458";
    //postController.text = "4587 9856 7454 5146";
    expiryController.text = "09/24";
    //lieuController.text = "4587 9856 7454 5146";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(
          "Add your credit card",
          style: GoogleFonts.gabriela(textStyle: const TextStyle(
              color: Color(0xff000000),
              fontWeight: FontWeight.bold,
              fontSize: 26
          )),
        ),
        //centerTitle: true,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(FontAwesomeIcons.arrowLeft,color: Color(0xff000000),)),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50,bottom: 0.0),
        children: [
          Container(
            //width: double.infinity,
            child: Form(
              key: _formcreditkey,
              child: Column(
                children: [
                  creditTextField(),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: expiryTextField()),
                      const SizedBox(width: 10,),
                      Expanded(child: cvvTextField()),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  countryType(),
                  const SizedBox(height: 20,),
                  postTextField(),
                  const SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 55,
                        width: 240,
                        child: ElevatedButton(
                          onPressed: (){
                            if(_formcreditkey.currentState!.validate()){
                              //print("Next page");
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SuccessScreen()));
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
                            "Complete order",
                            style: GoogleFonts.gabriela(textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  //Widget saisie credit card
  Widget creditTextField(){
    return TextFormField(
      style: GoogleFonts.gabriela(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF000000)
      ),
      controller: creditController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Indiquez votre numéro de carte de crédit';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        suffixIcon: const Icon(
            FontAwesomeIcons.camera,
            color: Color(0xFF000000)
        ),
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
        labelText: "Credit card",
        hintText: "4587 9856 7454 5146",
        hintStyle: GoogleFonts.gabriela(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF989898)
        ),
        errorStyle: GoogleFonts.gabriela(),
      ),
    );
  }

  //Widget saisie cvv
  Widget cvvTextField(){
    return TextFormField(
      obscureText: true,
      obscuringCharacter: '*',
      style: GoogleFonts.gabriela(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF000000)
      ),
      controller: cvvController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Indiquez votre numéro de cvv';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly
      ],
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
        labelText: "Cvv",
        hintText: "458",
        hintStyle: GoogleFonts.gabriela(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF989898)
        ),
        errorStyle: GoogleFonts.gabriela(),
      ),
    );
  }

  //Widget saisie expiry
  Widget expiryTextField(){
    return TextFormField(
      style: GoogleFonts.gabriela(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF000000)
      ),
      controller: expiryController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Indiquez la date d\'expiration de la carte';
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
        labelText: "Expiry",
        hintText: "09/24",
        hintStyle: GoogleFonts.gabriela(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF989898)
        ),
        errorStyle: GoogleFonts.gabriela(),
      ),
    );
  }

  //Widget saisie country
  Widget lieuTextField(){
    return TextFormField(
      style: GoogleFonts.gabriela(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF000000)
      ),
      controller: lieuController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Indiquez votre pays';
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

  Widget countryType(){
    return DropdownButtonFormField(
      style: GoogleFonts.gabriela(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF000000)
      ),
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
        labelText: "Country",
        labelStyle: GoogleFonts.gabriela(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF989898)
        ),
        errorStyle: GoogleFonts.gabriela(),
      ),
      icon: const Icon(
          FontAwesomeIcons.chevronDown,
          color: Color(0xFF000000)
      ),
      isExpanded: true,
      value: pays[1],
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          print(dropdownValue);
        });
      },
      validator: (valeur){
        if(valeur == 'Choisissez...'){
          return 'Faites un choix';
        }else{
          return null;
        }
      },
      items: pays.map<DropdownMenuItem<String>>((String pays) {
        return DropdownMenuItem<String>(
          value: pays,
          child: Text(
              pays,
              style: GoogleFonts.gabriela(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF000000)
              )),
        );
      }).toList(),
    );
  }

  //Widget saisie postcode
  Widget postTextField(){
    return TextFormField(
      style: GoogleFonts.gabriela(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF000000)
      ),
      controller: postController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Indiquez le code';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        suffixIcon: const Icon(
            FontAwesomeIcons.circleXmark,
            color: Color(0xFF000000)
        ),
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
        labelText: "Postcode",
        hintText: " ",
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
