import 'package:complete_e_commerce_app/Presentation/Home/Cubit/home_cubit.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/Products/Other_products_Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../Componanats/Colors.dart';

class Other_Products extends StatelessWidget {
  Other_Products({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final pro = cubit.productsmodel.data?.data;
        if (state is HomeProductsLoading) {
          return const Center(child: CircularProgressIndicator());
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
              itemCount: pro?.length,
              itemBuilder: (context, index2) {
                return InkWell(
                  onTap: () {
                    Get.to(() => Other_Products_Details(
                          index2: index2,
                        ));
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
                                  print(pro[index2].id);
                                  cubit.ChangeFavor(pro[index2].id as int);
                                },
                                icon: cubit.favoritelist[pro![index2].id]!
                                    ? Icon(Icons.favorite,
                                        color: Colors.red, size: 33)
                                    : Icon(
                                        Icons.favorite_outline,
                                        color: Colors.red,
                                      ),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              height: 100,
                              child: Hero(
                                tag: pro![index2].id.toString(),
                                child: Image.network(
                                  pro[index2].image ?? "",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(pro[index2].price.toString()),
                          const SizedBox(height: 5),
                          Text(
                            pro[index2].name ?? "",
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),
                          const Divider(),
                          InkWell(
                            onTap: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart),
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
