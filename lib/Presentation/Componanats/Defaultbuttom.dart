// import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:flutter/material.dart';

// import 'Colors.dart';

// import 'package:get/get.dart';
Widget defaultbuttom({
  @required String? text,
  // @required VoidCallback? ontap,
  double width = 380,
  double height = 60,
  double radius = 10,
  double fontsize = 20,
  Color? textColor = Colors.white,
  IconData? suffixicon,
  bool Sisvisible = false,
  bool Pisvisible = false,
  IconData? prefixicon,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
            colors: gcolors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Sisvisible == true
              ? Icon(
                  suffixicon,
                  color: Colors.white,
                  size: 35,
                )
              : SizedBox(),
          // MaterialButton(
          //   onPressed: ontap,
          //   child: Text(
          //     text!,
          //     style: TextStyle(
          //         fontSize: fontsize,
          //         fontWeight: FontWeight.bold,
          //         color: textColor),
          //   ),
          // ),
          SizedBox(
            width: Sisvisible == true ? 30 : 0,
          ),
          Text(
            text!,
            style: TextStyle(
                fontSize: fontsize,
                fontWeight: FontWeight.bold,
                color: textColor),
          ),
          SizedBox(
            width: Pisvisible == true ? 30 : 0,
          ),
          Pisvisible == true
              ? Icon(
                  prefixicon,
                  color: Colors.white,
                  size: 35,
                )
              : SizedBox(),
        ],
      ),
    );
