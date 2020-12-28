import 'package:bloc_cart_example/bloc/app_bloc/app_event.dart';
import 'package:bloc_cart_example/bloc/app_bloc/app_state.dart';
import 'package:bloc_cart_example/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  List<Product> _carts = List();

  AppBloc() : super(AppStateInitial());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if(event is AppEventAddToCart){
      yield* _addToCart(event.product);
    }else if(event is AppEventGetCart){
      yield* _getCart();
    }
  }

  Stream<AppState> _addToCart(Product p) async* {
    _carts.add(p);
  }

  Stream<AppState> _getCart() async* {
    yield(AppStateCart(_carts));
  }
}