import 'package:bloc_flutter/BLoC/bloc_provider.dart';
import 'package:bloc_flutter/BLoC/restaurant_bloc.dart';
import 'package:bloc_flutter/data_layer/location_model.dart';
import 'package:bloc_flutter/data_layer/restaurant_model.dart';
import 'package:bloc_flutter/ui/favourite_view.dart';
import 'package:bloc_flutter/ui/restaurant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloc_flutter/generated/l10n.dart';

import 'location_view.dart';

class RestaurantView extends StatelessWidget {
  final Location location;

  const RestaurantView({Key key, @required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => FavouriteView())),
          ),
        ],
      ),
      body: _buildSearch(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit_location),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LocationView(isFullScreenDialog: true),
            fullscreenDialog: true)),
      ),
    );
  }

  Widget _buildSearch(BuildContext context) {
    final bloc = RestaurantBloc(location);

    return BlocProvider<RestaurantBloc>(
      bloc: bloc,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: S.of(context).restaurantEatHint,
              ),
              onChanged: (query) => bloc.submitQuery(query),
            ),
          ),
          Expanded(child: _buildStreamBuilder(bloc)),
        ],
      ),
    );
  }

  Widget _buildStreamBuilder(RestaurantBloc bloc) {
    return StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot) {
          final results = snapshot.data;

          if (results == null)
            return Center(child: Text(S.of(context).restaurantEnterName));

          if (results.isEmpty)
            return Center(child: Text(S.of(context).noResults));

          return _buildSearchResults(results);
        });
  }

  Widget _buildSearchResults(List<Restaurant> results) {
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return RestaurantTile(restaurant: results[index]);
      },
    );
  }
}
