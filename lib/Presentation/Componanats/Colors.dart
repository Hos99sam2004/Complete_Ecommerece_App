import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color backgraund1 = const Color(0xFFFFFFFF);
Color backgraund2 = const Color(0xFFF4F5F9);
Color backgraund3 = const Color(0xFFF5F5F5);
Color text1 = const Color(0xFF868889);
Color text2 = const Color(0xFF000000);
Color link = const Color(0xFF407EC7);
Color border = const Color(0xFFEBEBEB);
Color primary = const Color(0xFFAEDC81);
Color primarydark = const Color(0xFF6CC51D);
Color primarylight = const Color(0xFFEBFFD7);
List<Color> gcolors = [primary, primarydark];

void ShowToast({required String text, required ToastState state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState {
  SUCCESS,
  ERROR,
  WARNING,
}

Color? ToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    // TODO: Handle this case.
    case ToastState.ERROR:
      color = Colors.red;
      break;
    // TODO: Handle this case.
    case ToastState.WARNING:
      color = Colors.amber;
      break;
    // TODO: Handle this case.
  }
  return color;
}
