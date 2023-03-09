import 'package:ecommerce_api/cubits/getdata/getdata.state.dart';
import 'package:ecommerce_api/models/item.model.dart';
import 'package:ecommerce_api/services/shop.api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitialState()) {
    getAllItems();
  }

  getAllItems() async {
    emit(DataLoading());

    try {
      List data = await ShopApi().getItemInfo();
      List<ItemModel> dataItem = [];
      for (Map i in data) {
        String title = i["title"].toString();
        String price = i["price"].toString();
        String desc = i["description"].toString();
        String cat = i["category"].toString();
        String img = i["image"].toString();

        dataItem.add(ItemModel(
            imgUrl: img,
            title: title,
            price: price,
            desc: desc,
            category: cat));
      }

      emit(DataLoaded(dataItem));
    } catch (e) {
      emit(DataErrorState("Error Occured"));
    }
  }
}
