import 'package:bloc_cart_example/model/product.dart';
import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable{}

class AppStateInitial implements AppState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class AppStateCart implements AppState {
  final List<Product> productsInCart;

  AppStateCart(this.productsInCart);

  @override
  List<Object> get props => [productsInCart];

  @override
  bool get stringify => false;

}