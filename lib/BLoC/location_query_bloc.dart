import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:bloc_flutter/data_layer/zomato_client.dart';
import 'bloc.dart';

class LocationQueryBloc implements Bloc {
  final _queryController = StreamController<List<Location>>();
  final _client = ZomatoClient();

  Stream<List<Location>> get locationStream => _queryController.stream;

  void submitQuery(String query) async {
    // final results = await _client.fetchLocations(query);
    // _queryController.sink.add(results);
    _queryController.sink.add(await _client.fetchLocations(query));
  }

  @override
  void dispose() {
      _queryController.close();
  }
}
