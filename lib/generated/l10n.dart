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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Trash Classifier`
  String get appTitle {
    return Intl.message(
      'Trash Classifier',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeScreenTitle {
    return Intl.message('Home', name: 'homeScreenTitle', desc: '', args: []);
  }

  /// `Scan Trash`
  String get scanTrash {
    return Intl.message('Scan Trash', name: 'scanTrash', desc: '', args: []);
  }

  /// `Account`
  String get accountScreenTitle {
    return Intl.message(
      'Account',
      name: 'accountScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `⚡ Handle with care!`
  String get taglineBattery {
    return Intl.message(
      '⚡ Handle with care!',
      name: 'taglineBattery',
      desc: '',
      args: [],
    );
  }

  /// `🌱 Nature’s own cycle.`
  String get taglineBiological {
    return Intl.message(
      '🌱 Nature’s own cycle.',
      name: 'taglineBiological',
      desc: '',
      args: [],
    );
  }

  /// `📦 Fold before recycling.`
  String get taglineCardboard {
    return Intl.message(
      '📦 Fold before recycling.',
      name: 'taglineCardboard',
      desc: '',
      args: [],
    );
  }

  /// `👕 Reuse before you refuse.`
  String get taglineClothes {
    return Intl.message(
      '👕 Reuse before you refuse.',
      name: 'taglineClothes',
      desc: '',
      args: [],
    );
  }

  /// `🥂 Fragile but recyclable.`
  String get taglineGlass {
    return Intl.message(
      '🥂 Fragile but recyclable.',
      name: 'taglineGlass',
      desc: '',
      args: [],
    );
  }

  /// `🔩 Strong. Recyclable. Eternal.`
  String get taglineMetal {
    return Intl.message(
      '🔩 Strong. Recyclable. Eternal.',
      name: 'taglineMetal',
      desc: '',
      args: [],
    );
  }

  /// `📄 Write, recycle, repeat.`
  String get taglinePaper {
    return Intl.message(
      '📄 Write, recycle, repeat.',
      name: 'taglinePaper',
      desc: '',
      args: [],
    );
  }

  /// `♻️ Think twice before single-use.`
  String get taglinePlastic {
    return Intl.message(
      '♻️ Think twice before single-use.',
      name: 'taglinePlastic',
      desc: '',
      args: [],
    );
  }

  /// `👟 Walk green!`
  String get taglineShoes {
    return Intl.message(
      '👟 Walk green!',
      name: 'taglineShoes',
      desc: '',
      args: [],
    );
  }

  /// `🗑️ Last stop: landfill.`
  String get taglineTrash {
    return Intl.message(
      '🗑️ Last stop: landfill.',
      name: 'taglineTrash',
      desc: '',
      args: [],
    );
  }

  /// `❓ Not sure what that is!`
  String get taglineUnknown {
    return Intl.message(
      '❓ Not sure what that is!',
      name: 'taglineUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Battery`
  String get batteryName {
    return Intl.message('Battery', name: 'batteryName', desc: '', args: []);
  }

  /// `Organic waste`
  String get biologicalName {
    return Intl.message(
      'Organic waste',
      name: 'biologicalName',
      desc: '',
      args: [],
    );
  }

  /// `Cardboard`
  String get cardboardName {
    return Intl.message('Cardboard', name: 'cardboardName', desc: '', args: []);
  }

  /// `Clothes`
  String get clothesName {
    return Intl.message('Clothes', name: 'clothesName', desc: '', args: []);
  }

  /// `Glass`
  String get glassName {
    return Intl.message('Glass', name: 'glassName', desc: '', args: []);
  }

  /// `Metal`
  String get metalName {
    return Intl.message('Metal', name: 'metalName', desc: '', args: []);
  }

  /// `Paper`
  String get paperName {
    return Intl.message('Paper', name: 'paperName', desc: '', args: []);
  }

  /// `Plastic`
  String get plasticName {
    return Intl.message('Plastic', name: 'plasticName', desc: '', args: []);
  }

  /// `Shoes`
  String get shoesName {
    return Intl.message('Shoes', name: 'shoesName', desc: '', args: []);
  }

  /// `Other waste`
  String get trashName {
    return Intl.message('Other waste', name: 'trashName', desc: '', args: []);
  }

  /// `Unknown`
  String get unknownName {
    return Intl.message('Unknown', name: 'unknownName', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Your Name`
  String get yourName {
    return Intl.message('Your Name', name: 'yourName', desc: '', args: []);
  }

  /// `Your Email`
  String get yourEmail {
    return Intl.message('Your Email', name: 'yourEmail', desc: '', args: []);
  }

  /// `Your Password`
  String get yourPassword {
    return Intl.message(
      'Your Password',
      name: 'yourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `This field is required`
  String get isRequired {
    return Intl.message(
      'This field is required',
      name: 'isRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get invalidEmail {
    return Intl.message(
      'Invalid email format',
      name: 'invalidEmail',
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
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
