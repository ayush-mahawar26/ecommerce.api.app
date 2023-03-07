import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/size_config.dart';

class ShopItemWidget extends StatelessWidget {
  const ShopItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  width: SizeConfig.swidth,
                  height: SizeConfig.sheight * 0.3,
                  image: NetworkImage(
                      "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: SizeConfig.swidth * 0.6,
                      child: Text("ItemName",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\u{20B9} 500 /-",
                      style: Theme.of(context).textTheme!.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey[600]),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.cart_fill_badge_plus,
                            size: 20,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("Save",
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
