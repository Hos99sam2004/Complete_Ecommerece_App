import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/Defaultbuttom.dart';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/HomePage.dart';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/Splash4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash3 extends StatelessWidget {
  const Splash3({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: new BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                  "assets/markus-spiske-i5tesTFPBjw-unsplash 1 (4).png"),
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
                  " Buy Premium",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  " Quality Fruits ",
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
                SizedBox(
                  height: screenHeight * 0.46,
                ),
                Image.asset("assets/pointers (2).png"),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const Splash4());
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
