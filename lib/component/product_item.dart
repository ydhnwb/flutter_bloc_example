import 'package:bloc_cart_example/model/product.dart';
import 'package:bloc_cart_example/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ProductItem extends StatelessWidget {
  final OnProductTap onTapItem;
  final Product product;

  ProductItem({@required this.product, @required this.onTapItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => onTapItem(product),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name), Text("Rp. ${product.price}")
            ],
          ),
          
          ),
      ),
    );
  }
}
