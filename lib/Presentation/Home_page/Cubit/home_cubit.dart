// import 'package:bloc/bloc.dart';
// import 'package:complete_e_commerce_app/Presentation/Auth/Login/Login.dart';
// import 'dart:ffi';

import 'package:complete_e_commerce_app/Presentation/Auth/Auth_Welcome.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/ApiConst.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/Cache_Helper.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/Dio_Helper.dart';
import 'package:complete_e_commerce_app/Presentation/Home_page/Models/Api_Fake_Store_Model.dart';
import 'package:complete_e_commerce_app/Presentation/Home_page/Models/Banner_Model.dart';
import 'package:complete_e_commerce_app/Presentation/Home_page/Models/Catagorie_Model.dart';
import 'package:complete_e_commerce_app/Presentation/Home_page/Models/Products_Model.dart';
import 'package:complete_e_commerce_app/Presentation/Home_page/Screens/Home.dart';
import 'package:complete_e_commerce_app/Presentation/Home_page/Screens/Person_Details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<ApiFakeStoreModel> productlist = [];
  BannerModel bannerModel = BannerModel();
  CatagorieModel categoriemodelData = CatagorieModel();
  ApiFakeStoreModel apiFakeStoreModel = ApiFakeStoreModel();
  ProductsModel productsmodel = ProductsModel();

  void getbanner() async {
    emit(HomeBannerLoading());

    try {
      final response = await ApiHelper.instance.get(ApiConst.BANNER);
      bannerModel = BannerModel.fromJson(response.data);
      if (bannerModel.status == true) {
        emit(HomeBannerSuccess());
      } else {
        emit(HomeBannerError());
      }
    } catch (e) {
      emit(HomeBannerError());
    }
  }

  void getCatagorieList() async {
    emit(HomeCategorieLoading());

    try {
      final response = await ApiHelper.instance.get(ApiConst.Categorie);
      categoriemodelData = CatagorieModel.fromJson(response.data);
      if (categoriemodelData.status == true) {
        emit(HomeCategorieSuccess());
      } else {
        emit(HomeCategorieError("Couldn't find a HomeCategorie"));
      }
    } catch (e) {
      emit(HomeCategorieError("Error: $e"));
    }
  }

  void getProducts() async {
    emit(HomeProductsLoading());
    try {
      final response =
          await ApiHelper.instance.get("https://fakestoreapi.com/products");
      //  myList = tempList.map((e) => PostModel.fromJson(e)).toList();
      if (response.statusCode == 200) {
        List product = [];
        product = response.data;
        productlist =
            product.map((e) => ApiFakeStoreModel.fromJson(e)).toList();

        emit(HomeProductsSuccess());
        // await Future.delayed(const Duration(seconds: 4));
      } else {
        emit(HomeProductsError(
          "Error: ${response.statusCode},}",
        ));
      }
    } catch (e) {
      emit(HomeProductsError("$e"));
      print(e);
    }
  }

  void otherProducts() async {
    emit(HomeProductsLoading());

    try {
      final response = await ApiHelper.instance.get(ApiConst.PRODUCTS);
      productsmodel = ProductsModel.fromJson(response.data);
      if (productsmodel.status == true) {
        emit(HomeProductsSuccess());
      } else {
        emit(HomeProductsError("Couldn't find a Products"));
      }
    } catch (e) {
      emit(HomeProductsError("Error : $e "));
    }
  }

  bool favorites = false;
  void addToFavorites(
    int index,
  ) {
    favorites = !favorites;
    emit(HomeProductsFavorite());
  }

  List<Widget> screans = [
    HomeScreen(),
    CleintDetails(),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.redAccent,
      child: InkWell(
        onTap: (){
        CacheHelper.RemoveData(key: "token");
        Get.to(()=>AuthWelcome());
      },child: Center(child: Text('Sign out ',style: TextStyle(color: Colors.white,))),
    ),
    ),
  ];
  int currentIndex = 0;
  void changeScreen(int index) {
    emit(HomeScreenChange());
    currentIndex = index;
    emit(HomeScreenChange());
  }

}
