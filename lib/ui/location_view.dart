import 'package:bloc_flutter/BLoC/bloc_provider.dart';
import 'package:bloc_flutter/BLoC/location_bloc.dart';
import 'package:bloc_flutter/BLoC/location_query_bloc.dart';
import 'package:bloc_flutter/data_layer/location_model.dart';
import 'package:flutter/material.dart';
import 'package:bloc_flutter/generated/l10n.dart';

class LocationView extends StatelessWidget {
  final bool isFullScreenDialog;

  const LocationView({Key key, this.isFullScreenDialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LocationQueryBloc();

    return BlocProvider<LocationQueryBloc>(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(title: Text(S.of(context).locationAppBar)),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: S.of(context).locationHint),
                onChanged: (query) => bloc.submitQuery(query),
              ),
            ),
            Expanded(child: _buildResults(bloc)),
          ],
        ),
      ),
    );
  }

  Widget _buildResults(LocationQueryBloc bloc) {
    return StreamBuilder<List<Location>>(
        stream: bloc.locationStream,
        builder: (context, snapshot) {
          final results = snapshot.data;

          if (results == null)
            return Center(child: Text(S.of(context).locationHint));

          if (results.isEmpty)
            return Center(child: Text(S.of(context).locationNoData));

          return _buildSearchResults(results);
        });
  }

  Widget _buildSearchResults(List<Location> results) {
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        final location = results[index];
        return ListTile(
          title: Text(location.title),
          onTap: () {
            final locationBloc = BlocProvider.of<LocationBloc>(context);
            locationBloc.selectLocation(location);

            if(isFullScreenDialog)
              Navigator.of(context).pop();
          }
        );
      }
    );
  }
}
