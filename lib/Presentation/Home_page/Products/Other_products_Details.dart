import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/Defaultbuttom.dart';
import 'package:complete_e_commerce_app/Presentation/Home_page/Cubit/home_cubit.dart';
import 'package:complete_e_commerce_app/Presentation/Home_page/MainHome.dart';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Other_Products_Details extends StatelessWidget {
  int index2;
  Other_Products_Details({super.key, required this.index2});

  @override

  Widget build(
      BuildContext context,
      ) {
    final cubit = context.read<HomeCubit>();
    final pro = cubit.productsmodel.data?.data;
    return SafeArea(
      child: Scaffold(
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
                        tag: pro![index2].id.toString(),
                        child: Image.network(
                          pro?[index2].image ?? "",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$ ${pro![index2].id.toString()}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primarydark),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            pro[index2].inFavorites=true;
                            cubit.addToFavorites(index2);
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
                  Text(pro?[index2].name ?? "",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: text2)),
                                SizedBox(height: 10,),
                  Text(pro?[index2].description ?? ""),
                  /// "Quantity of products available for the product"
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: backgraund1,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: Colors.grey),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text("Quantity",style: TextStyle(
                          fontSize: 18,
                        )),
                        Spacer(),
                        IconButton(onPressed: (){}, icon: Icon(Icons.exposure_minus_1,size: 25,color: primarydark,)),
      
                        Text("5",style: TextStyle(
                          fontSize: 18,
                          color: text2,
                          fontWeight: FontWeight.bold,
                        ),),
                        IconButton(onPressed: (){}, icon: Icon(Icons.plus_one,size: 25,color: primarydark,)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () { Get.to(()=>Homepage()); },
                      child: defaultbuttom(text: "Add To Cart",height: 50,textColor: backgraund1,prefixicon: Icons.shopping_bag_outlined,Pisvisible: true,Sisvisible: true,)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
