import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  String get description {
    return translate('description', args: {});
  }

  String get returnButton {
    return translate('returnButton', args: {});
  }



  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en':{
      "title": "Plant Catalog",
      "homePage": "Home Page",
      "plantDetails": "Plant Details",
      "search": "Search",
      "favorites": "Favorites",
      "notifications": "Notifications",
      "share": "Share",
      "return": "Return",
      "shareTitle": "Check out this plant: {plantName}",
      "shareText": "Scientific Name: {scientificName}\nFamily: {family}\nOrigin: {origin}\nDescription: {description}",
        "description": "Description",
        "returnButton": "RETURN"


    },
    'fr': {

        "title": "Catalogue de Plantes",
        "homePage": "Page d'accueil",
        "plantDetails": "Détails de la plante",
        "search": "Recherche",
        "favorites": "Favoris",
        "notifications": "Notifications",
        "share": "Partager",
        "return": "Retour"


    },

    // ... autres langues ...
  };

  String translate(String key, {required Map<String, String> args}) {
    return _localizedValues[locale.languageCode]![key]!;
  }

  String shareText(String scientificName, String family, String origin, String description) {
    return translate('shareText', args: {
      'scientificName': scientificName,
      'family': family,
      'origin': origin,
      'description': description,
    });
  }

  String shareTitle(String plantName) {
    return translate('shareTitle', args: {'plantName': plantName});
  }


}
