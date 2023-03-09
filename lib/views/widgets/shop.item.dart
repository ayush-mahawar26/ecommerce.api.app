import 'package:ecommerce_api/models/item.model.dart';
import 'package:ecommerce_api/services/shop.api.dart';
import 'package:ecommerce_api/views/item.desc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/size_config.dart';

class ShopItemWidget extends StatelessWidget {
  ItemModel item;
  ShopItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemDescription(model: item)));
      },
      child: Card(
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
                    image: NetworkImage(item.imgUrl),
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
                        child: Text(item.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\u{20B9} ${item.price} /-",
                        style: Theme.of(context).textTheme!.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600]),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ItemDescription(model: item)));
                      },
                      icon: Icon(CupertinoIcons.forward))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
