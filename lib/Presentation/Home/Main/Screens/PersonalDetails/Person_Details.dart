import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Cubit/home_cubit.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/Screens/FavoritesPage/Favorites.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/Screens/PersonalDetails/about_me/about_me_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CleintDetails extends StatelessWidget {
  const CleintDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    List DataList = [
      buildListTile(
        text: 'About Me',
        prefixIcon: Icons.person_pin_outlined,
      ),
      buildListTile(
        text: 'My orders',
        prefixIcon: Icons.shopping_bag_outlined,
      ),
      buildListTile(
        text: 'My Favorites',
        prefixIcon: Icons.favorite_outline,
      ),
      buildListTile(
        text: 'My Address',
        prefixIcon: Icons.pin_drop_outlined,
      ),
      buildListTile(
        text: 'Credit Cards',
        prefixIcon: Icons.credit_card,
      ),
      buildListTile(
        text: 'Credit Cards',
        prefixIcon: Icons.account_balance_wallet_outlined,
      ),
      buildListTile(
        text: 'Transactions',
        prefixIcon: Icons.monetization_on_outlined,
      ),
      buildListTile(
        text: 'Notifications',
        prefixIcon: Icons.notifications_none_outlined,
      ),
    ];
    List Screens = [
      AboutMePage(),
      Container(
        color: Colors.red,
      ),
      Favorites(),
      Container(
        color: Colors.pink,
      ),
      Container(
        color: Colors.orange,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.purple,
      ),
      Container(
        color: Colors.blueGrey,
      ),
    ];
    return Scaffold(
      backgroundColor: primarylight,
      appBar: AppBar(
        backgroundColor: primarylight,
        title: Text(
          'Personal Details',
          style: TextStyle(color: primarydark),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              ...List.generate(
                DataList.length,
                (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Screens[index]));
                    },
                    child: Card(
                      child: DataList[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile({required String text, required IconData prefixIcon}) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(fontSize: 22),
      ),
      leading: Icon(
        prefixIcon,
        size: 30,
        color: primarydark,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
