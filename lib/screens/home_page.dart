import 'package:ecommerce_demo/provider/product_provider.dart';
import 'package:ecommerce_demo/screens/cart_page.dart';
import 'package:ecommerce_demo/screens/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isInit = true;
   Future? _fetchData;

  Future<void> _getProductList() async {
    try {
      await Provider.of<ProductProvider>(context, listen: false)
          .getProductData();
    } catch (error) {
      print(error);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _fetchData = _getProductList();
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Mall',
          style: TextStyle(fontSize: 18,),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, size: 30),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => CartPage()));
              })
        ],
      ),
      body: FutureBuilder(
        future: _fetchData,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : Consumer<ProductProvider>(
            builder: (ctx, data, child) {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemCount:data.productList.length,
                itemBuilder: (ctx, index) {
                  final pdata = data.productList[index];
                  return ProductListItem(
                     productItem: pdata
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}