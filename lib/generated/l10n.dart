// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `BLoC Flutter`
  String get appBarTitle {
    return Intl.message(
      'BLoC Flutter',
      name: 'appBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Where do you want to eat?`
  String get locationAppBar {
    return Intl.message(
      'Where do you want to eat?',
      name: 'locationAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Enter a location`
  String get locationHint {
    return Intl.message(
      'Enter a location',
      name: 'locationHint',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get locationNoData {
    return Intl.message(
      'No data',
      name: 'locationNoData',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to eat?`
  String get restaurantEatHint {
    return Intl.message(
      'What do you want to eat?',
      name: 'restaurantEatHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter a restaurant name or cuisine type`
  String get restaurantEnterName {
    return Intl.message(
      'Enter a restaurant name or cuisine type',
      name: 'restaurantEnterName',
      desc: '',
      args: [],
    );
  }

  /// `No results`
  String get noResults {
    return Intl.message(
      'No results',
      name: 'noResults',
      desc: '',
      args: [],
    );
  }

  /// `Price: `
  String get restaurantPrice {
    return Intl.message(
      'Price: ',
      name: 'restaurantPrice',
      desc: '',
      args: [],
    );
  }

  /// `Rating: `
  String get restaurantRating {
    return Intl.message(
      'Rating: ',
      name: 'restaurantRating',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get restaurantFavourite {
    return Intl.message(
      'Favorite',
      name: 'restaurantFavourite',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get restaurantFavourites {
    return Intl.message(
      'Favourites',
      name: 'restaurantFavourites',
      desc: '',
      args: [],
    );
  }

  /// `No Favourites`
  String get restaurantNoFavourite {
    return Intl.message(
      'No Favourites',
      name: 'restaurantNoFavourite',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vn'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}