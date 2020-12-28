import 'package:bloc_cart_example/bloc/app_bloc/app_bloc.dart';
import 'package:bloc_cart_example/bloc/app_bloc/app_event.dart';
import 'package:bloc_cart_example/component/product_item.dart';
import 'package:bloc_cart_example/model/product.dart';
import 'package:bloc_cart_example/pages/my_cart/mycart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef void OnProductTap(Product product);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> _products = List<Product>.generate(
      15, (index) => Product.all(index, "Product $index", 50000));

  onTap(Product product) {
    print("Hello ${product.name}");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter demo"),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyCartPage())))
        ],
      ),
      body: BlocProvider.value(
        value: BlocProvider.of<AppBloc>(context),
        child: ListView.builder(
            itemCount: _products.length,
            itemBuilder: (context, index) {
              final p = _products[index];
              return ProductItem(
                  product: p, onTapItem: (Product product) => {
                    context.read<AppBloc>().add(AppEventAddToCart(product))
                  });
            }),
      ),
    );
  }
}
