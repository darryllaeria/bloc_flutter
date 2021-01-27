import 'package:bloc_flutter/BLoC/bloc_provider.dart';
import 'package:bloc_flutter/BLoC/favourite_bloc.dart';
import 'package:bloc_flutter/data_layer/restaurant_model.dart';
import 'package:bloc_flutter/ui/restaurant_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc_flutter/generated/l10n.dart';

class FavouriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavouriteBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).restaurantFavourites),
        ),
        body: StreamBuilder<List<Restaurant>>(
            stream: bloc.favouriteStream,
            initialData: bloc.favourites,
            builder: (context, snapshot) {
              List<Restaurant> favourites =
                  (snapshot.connectionState == ConnectionState.waiting)
                      ? bloc.favourites
                      : snapshot.data;

              if (favourites == null || favourites.isEmpty) {
                return Center(child: Text(S.of(context).restaurantNoFavourite));
              }

              return ListView.separated(
                  itemCount: favourites.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    return RestaurantTile(restaurant: favourites[index]);
                  });
            }));
  }
}
