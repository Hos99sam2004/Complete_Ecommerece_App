import 'package:flutter/material.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';

class Searchfunction extends SearchDelegate {
  List names = [
    "Hossam",
    "Ahmed",
    "Youssef",
    "Sara",
    "Nada",
    "Mahmoud",
    "Nasr"
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = " ";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: const Icon(Icons.close),
      onPressed: () {
        // Get.back();
        // CloseButton;
        Close;
      },
    );
    // return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text("$query"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filterList = names
        .where(
          (element) => element.contains(query),
        )
        .toList();
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: query == "" ? names.length : filterList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            query = (query == "" ? names[index] : filterList[index]);
            showResults(context);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: query == ""
                ? Text(
                    "${names[index]}",
                    style: TextStyle(fontSize: 25),
                  )
                : Text(
                    "${filterList[index]}",
                    style: TextStyle(fontSize: 25),
                  ),
          ),
        );
      },
    );
  }
}
