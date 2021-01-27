import 'dart:async';
import 'package:bloc_flutter/data_layer/location_model.dart';
import 'package:bloc_flutter/data_layer/zomato_client.dart';
import 'bloc.dart';

class LocationQueryBloc implements Bloc {
  final _queryController = StreamController<List<Location>>();
  final _client = ZomatoClient();

  Stream<List<Location>> get locationStream => _queryController.stream;

  void submitQuery(String query) async {
    _queryController.sink.add(await _client.fetchLocations(query));
  }

  @override
  void dispose() {
    _queryController.close();
  }
}
