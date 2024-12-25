import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/ApiConst.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/Cache_Helper.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/Dio_Helper.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Models/Api_Fake_Store_Model.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Models/Banner_Model.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Models/Catagorie_Model.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Models/ChangeFavoriets.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Models/Get_Favorites.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Models/Products_Model.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/Screens/FavoritesPage/Favorites.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/Screens/HomePage/Home.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/Screens/PersonalDetails/Person_Details.dart';
// import 'package:complete_e_commerce_app/Presentation/Home/Models/Search_model.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Models/model/model..profile.dart';
// import 'package:complete_e_commerce_app/Presentation/Home/Models/model/search/search.dart';
// import 'package:complete_e_commerce_app/Presentation/Home/Models/search_products/search_products.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<ApiFakeStoreModel> productlist = [];
  // List<ProductsModel> otherproducts = [];
  CatagorieModel categoriemodelData = CatagorieModel();
  BannerModel bannerModel = BannerModel();
  ApiFakeStoreModel apiFakeStoreModel = ApiFakeStoreModel();
  ProductsModel productsmodel = ProductsModel();
  Map<num, bool> favoritelist = {};

  void getbanner() async {
    emit(HomeBannerLoading());
    try {
      final response = await ApiHelper.instance.get(url: ApiConst.BANNER);
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
      final response = await ApiHelper.instance.get(url: ApiConst.Categorie);
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
      final response = await ApiHelper.instance
          .get(url: "https://fakestoreapi.com/products");
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
    }
  }

  void otherProducts() async {
    emit(HomeProductsLoading());

    try {
      final response = await ApiHelper.instance.get(
        url: ApiConst.PRODUCTS,
        headers: {"Authorization": " ${CacheHelper.getData(key: "token")}"},
      );
      productsmodel = ProductsModel.fromJson(response.data);

      if (productsmodel.status == true) {
        emit(HomeProductsSuccess());

        productsmodel.data!.data?.forEach((e) {
          favoritelist.addAll({e.id!: e.inFavorites!});
        });

        emit(HomeProductsSuccess());
      } else {
        emit(HomeProductsError("Couldn't find a Products"));
      }
    } catch (e) {
      emit(HomeProductsError("Error : $e "));
    }
  }

  List<Widget> screans = [
    HomeScreen(),
    CleintDetails(),
    Favorites(),
  ];
  int currentIndex = 0;
  void changeScreen(int index) {
    emit(HomeScreenChange());
    currentIndex = index;
    emit(HomeScreenChange());
  }

  bool favorites = false;
  void addToFavorites(
    int index,
  ) {
    favorites = !favorites;
    emit(HomeProductsFavorite());
  }

  ChangeFavoriets changeFavorietsmodels = ChangeFavoriets();

  void ChangeFavor(
    int? Id_Product,
  ) async {
    favoritelist[Id_Product!] = !favoritelist[Id_Product]!;
    emit(HomeFavoritesSuccess());
    // print(favoritelist[Id_Product]);
    // print(favoritelist);
    try {
      final response = await ApiHelper.instance.post(
        url: ApiConst.FAVORITES,
        body: {
          "product_id": Id_Product,
        },
        headers: {"Authorization": " ${CacheHelper.getData(key: "token")}"},
      );
      changeFavorietsmodels = ChangeFavoriets.fromJson(response.data);
      if (changeFavorietsmodels.status == true) {
        ShowToast(
            text: changeFavorietsmodels.message!, state: ToastState.SUCCESS);
        GetFavoritesData();
        emit(HomeFavoritesSuccess());
      } else {
        ShowToast(
            text: changeFavorietsmodels.message!, state: ToastState.WARNING);
        favoritelist[Id_Product] = !favoritelist[Id_Product]!;
        emit(HomeFavoritesError("Error"));
      }
    } catch (e) {
      ShowToast(text: changeFavorietsmodels.message!, state: ToastState.ERROR);
      emit(HomeFavoritesError("$e"));
    }
  }

  GetFavorites getFavorites = GetFavorites();
  void GetFavoritesData() async {
    emit(HomeGetFavoLoading());
    try {
      final response = await ApiHelper.instance.get(
        url: ApiConst.FAVORITES,
        headers: {"Authorization": " ${CacheHelper.getData(key: "token")}"},
      );
      getFavorites = GetFavorites.fromJson(response.data);

      if (getFavorites.status == true) {
        // print(response.data);
        emit(HomeGetFavoSuccess());
      } else {
        emit(HomeGetFavoError());
      }
    } catch (e) {
      print("$e");
      emit(HomeGetFavoError());
    }
  }

  // GetFavorites getProfileData = GetFavorites();
  Model modelprofiles = new Model();

  void getProfile() async {
    emit(HomeProfileLoading());
    try {
      final response = await ApiHelper.instance.get(
        url: ApiConst.PROFILE,
        headers: {"Authorization": " ${CacheHelper.getData(key: "token")}"},
      );
      modelprofiles = Model.fromJson(response.data);
      if (getFavorites.status == true) {
        emit(HomeProfileSuccess());
      } else {
        emit(HomeProfileError());
      }
    } catch (e) {
      print("$e");
      emit(HomeProfileError());
    }
  }
}
