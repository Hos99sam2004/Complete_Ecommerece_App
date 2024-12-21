import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/Featured_Products/Featured_Products.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/MainHome.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/Products/Other_Products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});
  //  Featured_Products(),
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'All Products',
            style: TextStyle(color: primarydark),
          ),
          centerTitle: true,
          backgroundColor: backgraund1,
          leading: IconButton(
              onPressed: () {
                Get.to(() => Mainhome());
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            ListView(
              children: [
                Container(height: 800, child: Featured_Products()),
              ],
            ),
            Other_Products()
          ],
        ),
      ),
    );
  }
}
