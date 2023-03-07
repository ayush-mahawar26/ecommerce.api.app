import 'package:ecommerce_api/constants/size_config.dart';
import 'package:ecommerce_api/views/widgets/shop.item.dart';
import 'package:flutter/material.dart';

class HomeScr extends StatelessWidget {
  HomeScr({super.key});

  TextEditingController sController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ecommerce"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: sController,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  hintText: "Search",
                  suffixIcon: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.search,
                        color: Colors.blue,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue))),
            ),
            ShopItemWidget()
          ],
        ),
      ),
    );
  }
}
