import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Cubit/home_cubit.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Models/Get_Favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      final fav = cubit.getFavorites.data?.data;
      if (state is HomeGetFavoLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is HomeGetFavoError) {
        return Center(child: Text("Error loading "));
      } else
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Favorites",
              style: TextStyle(
                  color: primarydark,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {},
                      child: _FavBuilder(fav![index], index, cubit, screenWidth,
                          screenHeight)),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: fav?.length ?? 0),
            ),
          ),
        );
    });
  }

  Container _FavBuilder(FavoriteData model, index, cubit, double screenWidth,
      double screenHeight) {
    return Container(
      width: screenWidth,
      child: Row(
        children: [
          Image.network(
            model.product!.image ?? "",
            width: screenWidth * 0.32,
            height: screenHeight * 0.34,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Container(
                  width: screenWidth * 0.37,
                  child: Text(model.product!.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ))),
              SizedBox(height: 8),
              Text(model.product!.price.toString(),
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              IconButton(
                onPressed: () {
                  // print(model[index].id);

                  cubit.ChangeFavor(model.product!.id);
                },
                icon: cubit.favoritelist[model.product!.id] == true
                    ? Icon(Icons.favorite, color: Colors.red, size: 33)
                    : Icon(
                        Icons.favorite_outline,
                        color: Colors.red,
                      ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
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
        ],
      ),
    );
  }
}

// Container(
//
//             color: Colors.redAccent,
//             child: InkWell(
//               onTap: (){
//                 CacheHelper.RemoveData(key: "token");
//                 Get.to(()=>AuthWelcome());
//               },child: Center(child: Text('Sign out ',style: TextStyle(color: Colors.white,))),
//             ),
//           ),
