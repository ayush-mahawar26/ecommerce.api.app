import 'package:ecommerce_api/views/home.scr.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case ("/home"):
        return MaterialPageRoute(builder: (context) => HomeScr());
    }
  }
}
