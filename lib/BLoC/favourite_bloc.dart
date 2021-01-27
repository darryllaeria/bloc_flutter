import 'dart:async';
import 'package:bloc_flutter/data_layer/restaurant_model.dart';
import 'bloc.dart';

class FavouriteBloc implements Bloc {
  var _restaurants = <Restaurant>[];
  List<Restaurant> get favourites => _restaurants;

  final _favouriteController = StreamController<List<Restaurant>>.broadcast();
  Stream<List<Restaurant>> get favouriteStream => _favouriteController.stream;

  void toggleRestaurant(Restaurant restaurant) {
    if(_restaurants.contains(restaurant)) {
      _restaurants.remove(restaurant);
    } else {
      _restaurants.add(restaurant);
    }
    _favouriteController.sink.add(_restaurants);
  }

  @override
  void dispose() {
    _favouriteController.close();
  }
}