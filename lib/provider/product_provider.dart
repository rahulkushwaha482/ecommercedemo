import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import '../model/product_list_model.dart';

class ProductProvider with ChangeNotifier {

  List<ProductListModel> _productList = [];
  List<ProductListModel> get productList => _productList;

  Future<void> getProductData() async {
    try {
      final response = await http.get(Uri.parse(
          'http://205.134.254.135/~mobile/MtProject/public/api/product_list.php'));
      var jsonData= jsonDecode(response.body);
      var notify = jsonData["data"];
      _productList = notify
          .map<ProductListModel>(
              (json) => ProductListModel.fromJson(json))
          .toList();
    } catch (error) {
      print(error);
    }
  }
}
