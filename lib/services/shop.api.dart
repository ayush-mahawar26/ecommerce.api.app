import 'dart:convert';

import 'package:http/http.dart' as http;

class ShopApi {
  String _baseUri = "https://fakestoreapi.com/products";

  Future getItemInfo() async {
    Uri uri = Uri.parse(_baseUri);

    http.Response response = await http.get(uri);
    List jsonArr = jsonDecode(response.body);

    return jsonArr;
  }
}
