import 'package:complete_e_commerce_app/Presentation/Auth/Auth_Welcome.dart';
import 'package:complete_e_commerce_app/Presentation/Auth/Login/Login.dart';
import 'package:complete_e_commerce_app/Presentation/Auth/Sign_up/Cubit/sign_cubit.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/Defaultbuttom.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/TextFormField.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/Screens/HomePage/Home.dart';
// import 'package:complete_e_commerce_app/Presentation/Home_page/Widgets/Home.dart';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/HomePage.dart';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/Splash5.dart';
// import 'package:complete_e_commerce_app/Presentation/page/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController _username = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _phoneNumper = new TextEditingController();
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<SignCubit, SignState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is SignSuccess) {
          Get.snackbar("Success: ", state.msg,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              duration: Duration(milliseconds: 500));

          Get.to(() => HomeScreen());
        }
        if (state is SignError) {
          Get.snackbar("Error: ", state.msg,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: Duration(milliseconds: 500));
        }
      },
      child: Scaffold(
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Image.asset(
                  'assets/portrait-female-person-supermarket-holding-fruit-smiling 1.png'),
              Positioned(
                  top: screenHeight * 0.03,
                  left: 40,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthWelcome()));
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ))),
              Positioned(
                  top: screenHeight * 0.04,
                  left: 163,
                  child: Text(
                    "Welcome",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
              Positioned(
                top: screenHeight * 0.45,
                child: SingleChildScrollView(
                  child: Container(
                    height: screenHeight,
                    width: screenWidth,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: backgraund2,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create account",
                            style: TextStyle(
                                fontSize: 20,
                                color: text2,
                                fontWeight: FontWeight.w800),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Quickly create account ",
                            style: TextStyle(fontSize: 18, color: text1),
                          ),
                          const SizedBox(height: 8),
                          CustomTextform(
                            hinttext: "User name",
                            prefixicon: Icons.person,
                            mycontroller: _username,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Can`t be Empty";
                              }
                            },
                          ),
                          const SizedBox(height: 8),
                          CustomTextform(
                            hinttext: 'Email address',
                            prefixicon: Icons.email_rounded,
                            mycontroller: _email,
                            validator: (value) {
                              if (!value!.isEmail) {
                                return "Please enter a valid email";
                              }
                            },
                            ispassword: false,
                          ),
                          const SizedBox(height: 8),
                          CustomTextform(
                            hinttext: "phone number",
                            prefixicon: Icons.phone,
                            keyboardType: TextInputType.phone,
                            mycontroller: _phoneNumper,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "invalid phone number";
                              }
                            },
                          ),
                          const SizedBox(height: 8),
                          CustomTextform(
                            hinttext: 'Password',
                            ispassword: true,
                            prefixicon: Icons.lock_outline,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Can`t be Empty";
                              }
                            },
                            mycontroller: _password,
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                context.read<SignCubit>().SignUp(
                                      email: _email.text,
                                      password: _password.text,
                                      PhoneNumber: _phoneNumper.text,
                                      UserName: _username.text,
                                    );
                              }
                            },
                            child: BlocBuilder<SignCubit, SignState>(
                              builder: (context, state) {
                                if (state is SignLoading) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                return defaultbuttom(
                                  textColor: Colors.white,
                                  text: "Signup",
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account ?",
                                  style: TextStyle(color: text1, fontSize: 18)),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => Login());
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.blue,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
