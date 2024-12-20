import 'package:complete_e_commerce_app/Presentation/Auth/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  bool value = false;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Switch(
            value: value,
            onChanged: (value) {
              setState(() {
                this.value = value;
              });
              Get.to(() => Login());
            },
          ),
        ),
      ),
    );
  }
}
