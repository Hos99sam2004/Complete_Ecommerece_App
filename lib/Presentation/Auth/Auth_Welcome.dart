import 'package:complete_e_commerce_app/Presentation/Auth/Login/Login.dart';
import 'package:complete_e_commerce_app/Presentation/Auth/Sign_up/Sign_up.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/Defaultbuttom.dart';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/HomePage.dart';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/Splash5.dart';
import 'package:flutter/material.dart';

class AuthWelcome extends StatelessWidget {
  const AuthWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
                'assets/beautiful-female-with-shopping-cart-walking-by-supermarket-freezer-choosing-what-buy 1.png'),
            Positioned(
                top: 68,
                left: 40,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Splash5()));
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ))),
            Positioned(
                top: 63,
                left: 163,
                child: Text(
                  "Welcome",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )),
            Positioned(
              top: 538,
              child: Container(
                height: 358,
                width: 414,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: backgraund2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 20,
                            color: text2,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 8),
                      Text(
                        textAlign: TextAlign.center,
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: TextStyle(fontSize: 18, color: text1),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 380,
                          decoration: BoxDecoration(
                            color: backgraund1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/Group 4.png"),
                              Text(
                                "Containues with Google ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: defaultbuttom(
                              textColor: Colors.white,
                              text: "Create Account",
                              Sisvisible: true,
                              suffixicon: Icons.account_circle_outlined),
                        ),
                      ),
                      // SizedBox(height: 17),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("I have already an account ",
                              style: TextStyle(color: text1, fontSize: 18)),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color:
                                    Colors.blue, // You can customize the color
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
