import 'package:ecommerce_demo/model/product_list_model.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  ProductListModel productListModel;
   ProductDetail({Key? key, required this.productListModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          productListModel.title.toString(),
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
                tag: 'product${productListModel.id}', 
                child: Image.network(
                  productListModel.image.toString(),
                  fit: BoxFit.contain,
                )),
          ],
        ),
      ),
    );
  }
}
