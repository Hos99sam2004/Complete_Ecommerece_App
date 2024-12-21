import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/Defaultbuttom.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Cubit/home_cubit.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/MainHome.dart';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductsDetails extends StatelessWidget {
  int index;
  ProductsDetails({super.key, required this.index});

  @override
  Widget build(
    BuildContext context,
  ) {
    final cubit = context.read<HomeCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(() => Mainhome());
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Container(
                    color: primarydark,
                    height: 420,
                    width: double.infinity,
                    child: Hero(
                      tag: cubit.productlist[index].id.toString(),
                      child: Image.network(
                        cubit.productlist[index].image ?? "",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "\$ ${cubit.productlist[index].price.toString()}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primarydark),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          cubit.addToFavorites(index);
                        },
                        icon: cubit.favorites == false
                            ? Icon(
                                Icons.favorite_outline,
                                color: Colors.red,
                                size: 25,
                              )
                            : Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 33,
                              )),
                  ],
                ),
                Text(cubit.productlist[index].title.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: text2)),
                Row(
                  children: [
                    Text(
                      "(${cubit.productlist[index].rating!.rate.toString()})",
                      style: TextStyle(
                        fontSize: 18,
                        color: text2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.yellowAccent,
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.yellowAccent,
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.yellowAccent,
                    ),
                    Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.yellowAccent,
                    ),
                    Icon(
                      Icons.star_half,
                      size: 25,
                      color: Colors.yellowAccent,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "( ${cubit.productlist[index].rating!.count.toString()}  reviews ... )",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(cubit.productlist[index].description.toString()),

                /// "Quantity of products available for the product"
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: backgraund1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Quantity",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.exposure_minus_1,
                            size: 25,
                            color: primarydark,
                          )),
                      Text(
                        "5",
                        style: TextStyle(
                          fontSize: 18,
                          color: text2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.plus_one,
                            size: 25,
                            color: primarydark,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      Get.to(() => Homepage());
                    },
                    child: defaultbuttom(
                        text: "Add To Cart",
                        height: 50,
                        textColor: backgraund1,
                        prefixicon: Icons.shopping_bag_outlined,
                        Pisvisible: true,
                        Sisvisible: true)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
