import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';

class CustomTextform extends StatefulWidget {
  String? hinttext;
  TextEditingController? mycontroller;
  String? title;
  bool obscuretext = false;
  String? Function(String?)? validator;
  bool ispassword = false;
  bool titlevisible = false;
  IconData? prefixicon;
  TextInputType? keyboardType;

  CustomTextform({
    super.key,
    required this.hinttext,
    this.obscuretext = false,
    this.keyboardType,
    this.mycontroller,
    this.title,
    this.validator,
    this.prefixicon,
    this.ispassword = false,
    this.titlevisible = false,
  });

  @override
  State<CustomTextform> createState() => _CustomTextformState();
}

class _CustomTextformState extends State<CustomTextform> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      obscureText: widget.obscuretext,
      validator: widget.validator,
      controller: widget.mycontroller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hinttext,
          label: widget.titlevisible == true ? Text(widget.title!) : null,
          hintStyle: const TextStyle(color: Colors.blueGrey, fontSize: 15),
          suffixIcon: widget.ispassword == true
              ? InkWell(
                  onTap: () {
                    widget.obscuretext = !widget.obscuretext;
                    setState(() {});
                  },
                  child: widget.obscuretext == false
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.visibility_off_outlined),
                )
              : null,
          prefixIcon: Icon(widget.prefixicon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          )),
    );
  }
}

// hfuf

/*
Widget CustomTextform({
  required String hinttext,
  String? title,
  bool titlevisible = false,
  // IconData? suffixicon,
  bool ispassword = false,
  bool obscuretext = false,
  IconData? prefixicon,
  required TextEditingController mycontroller,
  String Function(String?)? validator,
}) =>
    TextFormField(
      validator: validator,
      controller: mycontroller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hinttext,
          label: titlevisible == true ? Text(title!) : null,
          hintStyle: const TextStyle(color: Colors.blueGrey, fontSize: 15),
          suffixIcon: ispassword == true
              ? InkWell(
                  onTap: () {
                    obscuretext = !obscuretext;
                  },
                  child: Icon(Icons.remove_red_eye))
              : null,
          prefixIcon: Icon(prefixicon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          )),
    );
*/