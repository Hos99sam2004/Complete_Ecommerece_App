import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ClipRRect(
          child: Column(
            children: [
              Image.asset(
                "assets/Passionate-cuate 1.png",
                width: 400,
                height: 400,
              ),
              const SizedBox(height: 100),
              const Text(
                "Enjoy Quality Food ",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
