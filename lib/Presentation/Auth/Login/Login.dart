import 'package:complete_e_commerce_app/Presentation/Auth/Auth_Welcome.dart';
import 'package:complete_e_commerce_app/Presentation/Auth/Login/Cubit/login_cubit.dart';
import 'package:complete_e_commerce_app/Presentation/Auth/Sign_up/Sign_up.dart';
import 'package:complete_e_commerce_app/Presentation/Auth/Test.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/Defaultbuttom.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/TextFormField.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/MainHome.dart';
// import 'package:complete_e_commerce_app/Presentation/Home_page/Widgets/Home.dart';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/HomePage.dart';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/Splash5.dart';
// import 'package:complete_e_commerce_app/Presentation/page/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // double? height_for_container;
  // double? top_for_container;
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  bool val = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          state.msg !=
                  "This credentials does not meet any of our records, please make sure you have entered the right credentials"
              ? Get.to(() => Mainhome())
              : Get.snackbar("Error", state.msg,
                  backgroundColor: Colors.red, colorText: Colors.white);
          ;
        }
        if (state is LoginError) {
          Get.snackbar("Error: ", state.msg,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: Duration(milliseconds: 500));
        }
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Container(
            height: screenHeight,
            width: screenWidth,
            child: Stack(
              children: [
                Image.asset(
                    'assets/woman-with-shopping-list-standing-by-fridge-supermarket-checking-cart 1.png'),
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
                    top: screenHeight * 0.039,
                    left: 163,
                    child: Text(
                      "Welcome",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
                Positioned(
                  top: screenHeight * 0.48,
                  child: SingleChildScrollView(
                    child: Container(
                      height: screenHeight * 0.59,
                      width: screenWidth,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: backgraund2,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome Back !",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: text2,
                                      fontWeight: FontWeight.w800),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  textAlign: TextAlign.center,
                                  " Sign in to your account ",
                                  style: TextStyle(fontSize: 18, color: text1),
                                ),
                                const SizedBox(height: 20),
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
                                  hinttext: 'Password',
                                  ispassword: true,
                                  obscuretext: true,
                                  prefixicon: Icons.lock_outline,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Can`t be Empty";
                                    }
                                  },
                                  mycontroller: _password,
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Switch(
                                      activeColor: Colors.green,
                                      value: val,
                                      onChanged: (value) {
                                        setState(() {
                                          val = value;
                                          Get.to(() => Mainhome());
                                        });
                                      },
                                    ),
                                    Text(
                                      " Remember Me",
                                      style:
                                          TextStyle(color: text1, fontSize: 15),
                                    ),
                                    Spacer(),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text("Forgot Password",
                                            style: TextStyle(
                                              color: Colors
                                                  .blue, // You can customize the color
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ))),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    if (_formkey.currentState!.validate()) {
                                      context.read<LoginCubit>().login(
                                          email: _email.text,
                                          password: _password.text);

                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //         const HomeScreen()));
                                    }
                                  },

                                  ///
                                  ///
                                  /// nasrHossam@gmail.com
                                  ///
                                  /// 992004
                                  ///
                                  ///
                                  child: BlocBuilder<LoginCubit, LoginState>(
                                    builder: (context, state) {
                                      if (state is LoginLoading) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                      return defaultbuttom(
                                        text: "Login",
                                        textColor: Colors.white,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(" Didn`t have an account ? ",
                                        style: TextStyle(
                                            color: text1, fontSize: 18)),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignUp()));
                                      },
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: Colors
                                              .blue, // You can customize the color
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
