// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
    'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = locale.countryCode?.isEmpty ?? false
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      AppLocalizations._current = AppLocalizations();

      return AppLocalizations._current!;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
    'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get shareTitle {
    return Intl.message(
      'Share {plantName}',
      name: 'shareTitle',
      desc: '',
      args: [],
    );
  }

  String shareText(String scientificName, String family, String origin, String description) {
    return Intl.message(
      '{scientificName}\nFamily: {family}\nOrigin: {origin}\nDescription: {description}',
      name: 'shareText',
      desc: '',
      args: [scientificName, family, origin, description],
    );
  }

  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  String get returnButton {
    return Intl.message(
      'Return',
      name: 'returnButton',
      desc: '',
      args: [],
    );
  }

  String get plantDetails {
    return Intl.message(
      'Plant Details',
      name: 'plantDetails',
      desc: '',
      args: [],
    );
  }

  String get homePage {
    return Intl.message(
      'Home Page',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  String get title {
    return Intl.message(
      'Plant Catalog',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  static initializeMessages(String localeName) {}
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
