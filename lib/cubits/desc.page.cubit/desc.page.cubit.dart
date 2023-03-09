import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionCubit extends Cubit<int> {
  DescriptionCubit() : super(1) {
    _counter = 1;
  }

  int _counter = 1;
  int _totalPrice = 0;
  int get getCount => _counter;
  int get tPrice => _totalPrice;

  incrementCounter() {
    _counter++;
    emit(_counter);
  }

  decrementCounter() {
    if (_counter > 1) {
      _counter--;
    }
    emit(_counter);
  }
}
