import 'package:bloc_cart_example/bloc/app_bloc/app_bloc.dart';
import 'package:bloc_cart_example/bloc/app_bloc/app_event.dart';
import 'package:bloc_cart_example/bloc/app_bloc/app_state.dart';
import 'package:bloc_cart_example/component/product_item.dart';
import 'package:bloc_cart_example/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartPage extends StatefulWidget {
  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  AppBloc _appBloc;

  @override
  void initState() {
    _appBloc = BlocProvider.of<AppBloc>(context);
    _appBloc.add(AppEventGetCart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My cart"),
      ),
      body: BlocBuilder(
        cubit: _appBloc,
        builder: (context, state) {
          if (state is AppStateCart){
            return ListView.builder(
              itemCount: state.productsInCart.length,
              itemBuilder: (context, index) {
                return ProductItem(
                  onTapItem: (Product p) => {
                    print("tapped")
                  },
                  product: state.productsInCart[index],
                );
              }
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
