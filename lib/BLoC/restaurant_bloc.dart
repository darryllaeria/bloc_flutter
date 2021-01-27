import 'dart:async';

import 'package:bloc_flutter/BLoC/bloc.dart';
import 'package:bloc_flutter/data_layer/location_model.dart';
import 'package:bloc_flutter/data_layer/restaurant_model.dart';
import 'package:bloc_flutter/data_layer/zomato_client.dart';

class RestaurantBloc implements Bloc {
  final Location location;
  final _client = ZomatoClient();
  final _restaurantController = StreamController<List<Restaurant>>();

  Stream<List<Restaurant>> get stream => _restaurantController.stream;
  RestaurantBloc(this.location);

  void submitQuery(String query) async {
    _restaurantController.sink.add(await _client.fetchRestaurants(location, query));
  }

  @override
  void dispose() {
    _restaurantController.close();
  }
}
