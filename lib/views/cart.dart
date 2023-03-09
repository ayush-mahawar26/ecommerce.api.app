import 'package:ecommerce_api/models/item.model.dart';
import 'package:ecommerce_api/views/widgets/shop.item.dart';
import 'package:flutter/material.dart';

class CartScr extends StatelessWidget {
  const CartScr({super.key});

  static List<ItemModel> lst = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add To Cart"),
      ),
      body: (lst.isNotEmpty)
          ? ListView.builder(
              itemCount: lst.length,
              itemBuilder: (context, index) {
                return ShopItemWidget(item: lst[index]);
              },
            )
          : const Center(
              child: Text("No Item in Cart"),
            ),
    );
  }
}
