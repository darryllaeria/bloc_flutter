// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appBarTitle" : MessageLookupByLibrary.simpleMessage("BLoC Flutter"),
    "locationAppBar" : MessageLookupByLibrary.simpleMessage("Where do you want to eat?"),
    "locationHint" : MessageLookupByLibrary.simpleMessage("Enter a location"),
    "locationNoData" : MessageLookupByLibrary.simpleMessage("No data"),
    "noResults" : MessageLookupByLibrary.simpleMessage("No results"),
    "restaurantEatHint" : MessageLookupByLibrary.simpleMessage("What do you want to eat?"),
    "restaurantEnterName" : MessageLookupByLibrary.simpleMessage("Enter a restaurant name or cuisine type"),
    "restaurantFavourite" : MessageLookupByLibrary.simpleMessage("Favorite"),
    "restaurantFavourites" : MessageLookupByLibrary.simpleMessage("Favourites"),
    "restaurantNoFavourite" : MessageLookupByLibrary.simpleMessage("No Favourites"),
    "restaurantPrice" : MessageLookupByLibrary.simpleMessage("Price: "),
    "restaurantRating" : MessageLookupByLibrary.simpleMessage("Rating: ")
  };
}
