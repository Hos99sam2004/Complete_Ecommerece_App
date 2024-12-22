// import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/Defaultbuttom.dart';
// import 'package:complete_e_commerce_app/Presentation/SplashScreens/HomePage.dart';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/Splash3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: new BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                  "assets/markus-spiske-i5tesTFPBjw-unsplash 1 (3).png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  " Buy Quality",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  " Dairy Products ",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 450,
                ),
                Image.asset("assets/pointers.png"),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const Splash3());
                  },
                  child: defaultbuttom(
                      text: " Get Started ",
                      textColor: Colors.white,
                      radius: 12),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
