import 'package:complete_e_commerce_app/Presentation/Home/Cubit/home_cubit.dart';

import 'package:complete_e_commerce_app/Presentation/Home/Main/Search_Function/SearchFunction.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/Search_Function/search_screen/search_screen_page.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../Componanats/Colors.dart';
import '../../Bannar_List/Bannar_List.dart';
import '../../Featured_Products/Featured_Products.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final cubit = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeBannerLoading ||
            state is HomeProductsLoading ||
            state is HomeCategorieLoading) {
          Center(child: CircularProgressIndicator());
        }
      },
      builder: (BuildContext context, state) {
        if (state is HomeDataLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        // showSearch(
                        //     context: context, delegate: Searchfunction());
                        Get.to(() => SearchScreenPage());
                      },
                      child: Container(
                        height: screenHeight * 0.07,
                        decoration: BoxDecoration(
                          color: backgraund2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              const Icon(Icons.search,
                                  size: 30, color: Color(0xFF868889)),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Search",
                                style: TextStyle(fontSize: 23, color: text1),
                              ),
                              const Spacer(),
                              Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: const Icon(Icons.menu,
                                      size: 40, color: Color(0xFF868889))),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                      if (state is HomeBannerLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return const Bannar_List();
                      }
                    }),
                    const SizedBox(height: 10),

                    /// The Catagorie Products list
                    Row(
                      children: [
                        const Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: const Icon(Icons.arrow_forward_ios,
                              size: 20, color: Color(0xFF868889)),
                        ),
                      ],
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                      if (state is HomeCategorieLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Container(
                          height: screenHeight * 0.15,
                          color: backgraund2,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  cubit.categoriemodelData.data?.data?.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 70,
                                      width: 80,
                                      child: cubit.categoriemodelData.data
                                                  ?.data?[index].image !=
                                              null
                                          ? Image.network(
                                              cubit.categoriemodelData.data!
                                                  .data![index].image!,
                                              fit: BoxFit.cover,
                                            )
                                          : Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                    ),
                                    Text(
                                      cubit.categoriemodelData.data
                                              ?.data?[index].name ??
                                          "",
                                    ),
                                  ],
                                );
                              }),
                        );
                      }
                    }),
                    const SizedBox(height: 10),

                    /// The Featured Products list
                    Row(
                      children: [
                        const Text(
                          "Featured products",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: const Icon(Icons.arrow_forward_ios,
                              size: 20, color: Color(0xFF868889)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Featured_Products(),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
