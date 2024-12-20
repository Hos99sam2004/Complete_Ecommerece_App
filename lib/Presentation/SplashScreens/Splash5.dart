import 'package:complete_e_commerce_app/Presentation/Auth/Auth_Welcome.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/Cache_Helper.dart';

import 'package:complete_e_commerce_app/Presentation/SplashScreens/pages/page1.dart';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/pages/page2.dart';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/pages/page3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Splash5 extends StatefulWidget {
  const Splash5({super.key});

  @override
  State<Splash5> createState() => _Splash5State();
}

class _Splash5State extends State<Splash5> {
  final _controller = PageController();
  int? count;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 50),
              SizedBox(
                height: 660,
                child: PageView(
                  controller: _controller,
                  children: const [
                    Page1(),
                    Page2(),
                    Page3(),
                  ],
                ),
              ),
              const Text(
                textAlign: TextAlign.center,
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Submit();
                        // Get.to(() => AuthWelcome());
                      },
                      child: const Text(
                        " Skip  ",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      )),
                  SmoothPageIndicator(
                    onDotClicked: (index) => {
                      _controller.jumpToPage(index),
                      setState(() {
                        index = count = index;
                        count = index;
                      }),
                    },
                    controller: _controller,
                    count: 3,
                    effect: const JumpingDotEffect(
                      jumpScale: .7,
                      verticalOffset: 15,
                      activeDotColor: Color(0xFF6CC51D),
                      dotColor: Color(0xFFEBFFD7),
                      dotHeight: 15,
                      dotWidth: 15,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        if (_controller.page!.toInt() == 2) {
                          Get.to(() => AuthWelcome());
                        }
                      },
                      child: const Text(
                        " Next ",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void Submit() {
  CacheHelper.saveData(key: "Onboarding", value: true).then((value) {
    if (value) {
      Get.to(() => const AuthWelcome());
      // print(" ========================================== ture===============================");
    }
  });
  // Get.to(() => const AuthWelcome());
}
