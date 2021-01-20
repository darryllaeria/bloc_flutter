import 'package:bloc_flutter/BLoC/bloc_provider.dart';
import 'package:bloc_flutter/BLoC/location_bloc.dart';
import 'package:bloc_flutter/ui/location_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc_flutter/data_layer/location_model.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Location>(
        stream: BlocProvider.of<LocationBloc>(context).locationStream,
        builder: (context, snapshot) {
          return (snapshot.data == null) ? LocationView() : Container();
        });
  }
}
