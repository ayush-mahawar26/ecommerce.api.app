import 'package:ecommerce_api/constants/size_config.dart';
import 'package:ecommerce_api/cubits/desc.page.cubit/desc.page.cubit.dart';
import 'package:ecommerce_api/models/item.model.dart';
import 'package:ecommerce_api/views/cart.dart';
import 'package:ecommerce_api/views/widgets/show.mssg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDescription extends StatelessWidget {
  ItemModel model;
  ItemDescription({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    DescriptionCubit descCubit =
        BlocProvider.of<DescriptionCubit>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Card"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Image(
                        image: NetworkImage(model.imgUrl),
                        width: SizeConfig.swidth,
                        height: SizeConfig.sheight * 0.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            model.desc,
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () {
                                descCubit.incrementCounter();
                              },
                              child: const Icon(
                                Icons.add,
                                size: 50,
                              )),
                          Text(
                            descCubit.getCount.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 26),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () {
                                descCubit.decrementCounter();
                              },
                              child: const Icon(
                                CupertinoIcons.minus,
                                size: 50,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: SizeConfig.swidth * 0.5 - 10,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.bag_fill),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Buy",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.swidth * 0.5 - 10,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      CartScr.lst.add(model);
                      ShowMessg()
                          .showSnackbar("Your Item Added to Cart", context);
                    },
                    icon: const Icon(CupertinoIcons.cart_badge_plus),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: (CartScr.lst.contains(model))
                          ? Text(
                              "Remove",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.white),
                            )
                          : Text(
                              "Add To Cart",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
