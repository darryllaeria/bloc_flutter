import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bloc_flutter/generated/l10n.dart';

class LocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).locationAppBar)),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: S.of(context).locationHint),
            ),
          ),
          Expanded(child: _buildResults()),
          ],
      ),
    );
  }

  Widget _buildResults() {
    return Center(child: Text(S.current.locationHint));
  }
}
