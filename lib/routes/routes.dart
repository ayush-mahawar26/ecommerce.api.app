import 'package:ecommerce_api/models/item.model.dart';
import 'package:ecommerce_api/views/cart.dart';
import 'package:ecommerce_api/views/home.scr.dart';
import 'package:ecommerce_api/views/item.desc.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case ("/home"):
        return MaterialPageRoute(builder: (context) => HomeScr());
      case ("/cart"):
        return MaterialPageRoute(builder: (context) => const CartScr());
    }
  }
}
