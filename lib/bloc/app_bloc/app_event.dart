import 'package:bloc_cart_example/model/product.dart';
import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {}

class AppEventAddToCart implements AppEvent {
  final Product product;

  AppEventAddToCart(this.product);

  @override
  List<Object> get props => [product];

  @override
  bool get stringify => false;

}

class AppEventGetCart implements AppEvent {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;

}