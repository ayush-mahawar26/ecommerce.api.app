import 'dart:async';

import 'package:ecommerce_api/constants/size_config.dart';
import 'package:ecommerce_api/models/item.model.dart';
import 'package:ecommerce_api/services/shop.api.dart';
import 'package:ecommerce_api/views/widgets/shop.item.dart';
import 'package:ecommerce_api/views/widgets/show.mssg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScr extends StatefulWidget {
  HomeScr({super.key});

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  TextEditingController sController = TextEditingController();
  List<ItemModel> items = [];
  List<ItemModel> real = [];

  void fetchData() async {
    List lst = await ShopApi().getItemInfo();

    for (Map i in lst) {
      ItemModel item = ItemModel(
          imgUrl: i["image"],
          title: i["title"],
          price: i["price"].toString(),
          desc: i["description"],
          category: i["category"]);
      items.add(item);

      real = items;
      setState(() {});
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ecommerce"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/cart');
              },
              child: const Icon(CupertinoIcons.cart_fill),
            ),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: sController,
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: InkWell(
                      onTap: () {
                        String val = sController.text;
                        setState(() {
                          if (val.isEmpty) {
                            items = real;
                          } else {
                            List<ItemModel> filtered = items
                                .where((element) => element.title
                                    .toLowerCase()
                                    .contains(val.toLowerCase()))
                                .toList();

                            if (filtered.isNotEmpty) {
                              items = filtered;
                            } else {
                              items = items
                                  .where((element) => element.category
                                      .toLowerCase()
                                      .contains(val.toLowerCase()))
                                  .toList();
                            }
                          }
                        });
                      },
                      child: const Icon(Icons.search)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      )),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ShopItemWidget(item: items[index]);
                    }),
              )
            ],
          )),
    );
  }
}
