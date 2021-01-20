import 'package:bloc_flutter/BLoC/bloc_provider.dart';
import 'package:bloc_flutter/ui/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'BLoC/location_bloc.dart';
import 'generated/l10n.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationBloc>(
        bloc: LocationBloc(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            home: MainView()));
  }
}
