import 'package:ecommerce_api/models/item.model.dart';
import 'package:flutter/widgets.dart';

abstract class DataState {}

class DataInitialState extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  List<ItemModel> data;
  DataLoaded(this.data);
}

class DataErrorState extends DataState {
  String error;
  DataErrorState(this.error);
}
