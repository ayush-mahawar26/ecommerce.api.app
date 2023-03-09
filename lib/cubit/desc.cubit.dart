import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionCubit extends Cubit<int> {
  DescriptionCubit() : super(1);

  int _counter = 1;

  int get getCounter => _counter;

  increment() {
    _counter++;
    emit(_counter);
  }

  decrement() {
    if (_counter > 1) {
      _counter--;
      emit(_counter);
    }
  }
}
