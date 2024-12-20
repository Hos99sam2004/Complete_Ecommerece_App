import 'package:complete_e_commerce_app/Presentation/Home_page/Cubit/home_cubit.dart';
import 'package:complete_e_commerce_app/Presentation/Home_page/Products/Products_Details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../Componanats/Colors.dart';

class Featured_Products extends StatefulWidget {
  Featured_Products({
    super.key,
  });

  @override
  State<Featured_Products> createState() => _Featured_ProductsState();
}

class _Featured_ProductsState extends State<Featured_Products> {
  @override


  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeProductsLoading) {
          return  Center(child: CircularProgressIndicator());
        } else if (state is HomeProductsError) {
          return Center(child: Text("${state.msg}"));
        } else
          return Container(
            height: 370,
            decoration: BoxDecoration(
              color: backgraund3,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 260),
              itemCount: cubit.productlist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(()=>ProductsDetails(index: index));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: backgraund1,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Spacer(),
                              IconButton(
                                  onPressed: () {

                                    cubit.addToFavorites(index);

                                  },
                                  icon: cubit.favorites == false
                                      ? Icon(CupertinoIcons.heart,color: Colors.red,
                                  size: 25,)
                                      : Icon(
                                          CupertinoIcons.heart_solid,
                                    color: Colors.red,
                                    size: 33,
                                        )),
                            ],
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                  height: 100,
                                  child: Hero(
                                    tag: cubit.productlist[index].id.toString(),
                                    child: Image.network(
                                      cubit.productlist[index].image ?? "",
                                      fit: BoxFit.fill,
                                    ),
                                  ),),),
                          const SizedBox(height: 5),
                          Text(cubit.productlist[index].price.toString()),
                          const SizedBox(height: 5),
                          Text(cubit.productlist[index].category ?? ""),
                          const Divider(),
                          InkWell(
                            onTap: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.shopping_cart),
                                Text("Add To Cart"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
      },
    );
  }
}
