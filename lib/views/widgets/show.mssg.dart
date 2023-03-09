import 'package:flutter/material.dart';

class ShowMessg {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
      String str, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(str),
      duration: const Duration(seconds: 1),
    ));
  }
}
