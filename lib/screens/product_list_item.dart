import 'package:ecommerce_demo/model/product_list_model.dart';
import 'package:ecommerce_demo/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import '../model/product_list_model.dart';

class ProductListItem extends StatelessWidget {
  ProductListModel productItem;

  ProductListItem({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String productList = productItem.title.toString();
    String productName = '';
    if (productList.length > 15) {
      productName = productList.substring(0, 15);
    } else {
      productName = productItem.title.toString();
    }
    return Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => ProductDetail(
                      productListModel: productItem,
                    )));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                    tag: 'product${productItem.id}',
                    child: Image.network(
                      productItem.image.toString(),
                      fit: BoxFit.contain,
                    )),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        productName,
                        style:
                            const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      const Icon(Icons.shopping_cart)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
