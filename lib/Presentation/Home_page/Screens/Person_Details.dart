import 'package:complete_e_commerce_app/Presentation/Componanats/Colors.dart';
import 'package:flutter/material.dart';

class CleintDetails extends StatelessWidget {
  const CleintDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List DataList = [
      buildListTile(text: 'About Me', prefixIcon: Icons.person_pin_outlined ,),
      buildListTile(text: 'My orders', prefixIcon: Icons.shopping_bag_outlined,),
      buildListTile(text: 'My Favorites', prefixIcon: Icons.favorite_outline,),
      buildListTile(text: 'My Address', prefixIcon: Icons.pin_drop_outlined,),
      buildListTile(text: 'Credit Cards', prefixIcon: Icons.credit_card,),
      buildListTile(text: 'Credit Cards', prefixIcon: Icons.account_balance_wallet_outlined,),
      buildListTile(text: 'Transactions', prefixIcon: Icons.monetization_on_outlined,),
      buildListTile(text: 'Notifications', prefixIcon: Icons.notifications_none_outlined,),
    ];
    List Screens = [
      Container(color: Colors.green,),
      Container(color: Colors.red,),
      Container(color: Colors.amber,),
      Container(color: Colors.pink,),
      Container(color: Colors.orange,),
      Container(color: Colors.blue,),
      Container(color: Colors.purple,),
      Container(color: Colors.blueGrey,),
    ];
    return  Scaffold(
      backgroundColor: backgraund3,
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
                  child: Image.asset("assets/test.png",fit: BoxFit.fill,),
                ),
              ),
          ...List.generate(DataList.length, (index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Screens[index]));
                },
                child: Card(
                  child: DataList[index],
                ),
              );
            },),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile({ required String text, required IconData prefixIcon}) {
    return ListTile(
            title: Text(text,style: TextStyle(fontSize: 22),),
            leading: Icon(prefixIcon,size: 30,color: primarydark,),
            trailing: Icon(Icons.arrow_forward_ios),
          );
  }
}
