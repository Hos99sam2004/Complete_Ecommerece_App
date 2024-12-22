import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/TextFormField.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Cubit/home_cubit.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/Search_Function/search_screen/search/search_cubit.dart';
import 'package:flutter/cupertino.dart';
// import 'package:complete_e_commerce_app/Presentation/Home/Models/search_products/datum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreenPage extends StatelessWidget {
  SearchScreenPage({super.key});

  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  // GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  TextEditingController _Searchcontroller = new TextEditingController();

  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        // final search = cubit.searchProducts.data?.data;
        // final SearchFun = cubit.searchProducts.data?.data;
        return Scaffold(
          appBar: AppBar(
            title: const Text('SearchScreenPage'),
            centerTitle: true,
          ),
          body: Center(
              child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  // CustomTextform(
                  //   hinttext: 'Search',
                  //   keyboardType: TextInputType.text,
                  //   mycontroller: _Searchcontroller,
                  //   prefixicon: Icons.search,
                  //   titlevisible: true,
                  //   title: "Search",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return "Can`t be Empty";
                  //     }
                  //     return null;
                  //   },
                  //   onFieldSubmitted: (value) {
                  //     cubit.search(searchKey: value);
                  //   },
                  // ),

                  TextFormField(
                    controller: _Searchcontroller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Search',
                    ),
                    onFieldSubmitted: (value) {
                      print('User submitted:============ $value');
                      cubit.Cprint();
                      cubit.search(searchKey: value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (state is HomeSearchLoading) LinearProgressIndicator(),
                  if (state is HomeSearchError) Text("Error after loading"),
                  if (state is HomeSearchSuccess)
                    Expanded(
                      child: Container(
                        // color: primary,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount:
                              cubit.searchProducts.data?.data?.length ?? 10,
                          itemBuilder: (context, int index) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                child: Row(
                                  children: [
                                    cubit.searchProducts.data!.data?[index]
                                                .image !=
                                            null
                                        ? Image.network(
                                            // search[index].image ?? " ",
                                            cubit.searchProducts.data!
                                                    .data?[index].image ??
                                                "",
                                            width: 150,
                                            height: 170,
                                          )
                                        : Center(
                                            child: CupertinoActivityIndicator(),
                                          ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                            width: 150,
                                            child: Text(
                                                cubit.searchProducts.data!
                                                        .data?[index].name ??
                                                    "",
                                                overflow: TextOverflow.fade,
                                                softWrap: true,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                        SizedBox(height: 8),
                                        Text(
                                            cubit.searchProducts.data!
                                                    .data?[index].price
                                                    .toString() ??
                                                " ",
                                            style: TextStyle(fontSize: 16)),
                                        SizedBox(height: 8),
                                        // IconButton(
                                        //   onPressed: () {
                                        //     // print(model[index].id);
                                        //   },
                                        //   icon: cubit.favoritelist[cubit
                                        //           .searchProducts
                                        //           .data!
                                        //           .data?[index]
                                        //           .id]!
                                        //       ? Icon(Icons.favorite,
                                        //           color: Colors.red, size: 33)
                                        //       : Icon(
                                        //           Icons.favorite_outline,
                                        //           color: Colors.red,
                                        //         ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                            // return null;
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
/*
Container _FavBuilder(index, Datum search, cubit) {
  return Container(
    child: Row(
      children: [
        Image.network(
          search.image ?? "",
          width: 150,
          height: 170,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Container(
                width: 150,
                child: Text(search.name.toString(),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(height: 8),
            Text(search.price.toString(), style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            IconButton(
              onPressed: () {
                // print(model[index].id);

                cubit.ChangeFavor(search.id);
              },
              icon: cubit.favoritelist[search.id]
                  ? Icon(Icons.favorite, color: Colors.red, size: 33)
                  : Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                    ),
            ),
          ],
        ),
      ],
    ),
  );
}
*/