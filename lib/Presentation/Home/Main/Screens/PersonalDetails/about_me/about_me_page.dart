import 'package:complete_e_commerce_app/Presentation/Auth/Auth_Welcome.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/Defaultbuttom.dart';
import 'package:complete_e_commerce_app/Presentation/Componanats/TextFormField.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/Cache_Helper.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Cubit/home_cubit.dart';
import 'package:complete_e_commerce_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      backgroundColor: primarylight,
      appBar: AppBar(
        backgroundColor: primarylight,
        title: Text(
          'AboutMe',
          style: TextStyle(color: primarydark),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.greenAccent,
                  ),
                  child: cubit.modelprofiles.data?.image != null
                      ? Image.network(cubit.modelprofiles.data!.image!)
                      : Center(
                          child: CupertinoActivityIndicator(),
                        ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                // width: MediaQuery.sizeOf(context).width,
                child: Text(
                  'Name: ${cubit.modelprofiles.data?.name ?? 'Loading...'}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'Email: ${cubit.modelprofiles.data?.email ?? 'Loading...'}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Phone: ${cubit.modelprofiles.data?.phone ?? 'Loading...'}',
                    style: TextStyle(fontSize: 18),
                  )),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Id: ${cubit.modelprofiles.data?.id ?? 'Loading...'}',
                    style: TextStyle(fontSize: 18),
                  )),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'Credit: ${cubit.modelprofiles.data?.credit ?? 'Loading...'}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    'Token::  ${cubit.modelprofiles.data?.token ?? 'Loading...'}',
                    style: TextStyle(fontSize: 18),
                  )),
              InkWell(
                  onTap: () {
                    CacheHelper.RemoveData(key: "token");
                    Get.offAll(() => AuthWelcome());
                  },
                  child: defaultbuttom(
                    text: "Logout",
                    fontsize: 24,
                    radius: 20,
                  )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
