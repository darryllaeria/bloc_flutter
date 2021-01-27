import 'package:bloc_flutter/data_layer/restaurant_model.dart';
import 'package:bloc_flutter/ui/restaurant_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'image_container.dart';

class RestaurantTile extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantTile({Key key, @required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading:
            ImageContainer(width: 50.0, height: 50.0, url: restaurant.thumbUrl),
        title: Text(restaurant.name),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    RestaurantDetailsView(restaurant: restaurant)),
          );
        });
  }
}
