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

  /// `Don't have an account yet?`
  String get notHaveAccount {
    return Intl.message(
      'Don\'t have an account yet?',
      name: 'notHaveAccount',
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

  /// `User with this email was not found`
  String get errorUserNotFound {
    return Intl.message(
      'User with this email was not found',
      name: 'errorUserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password`
  String get errorWrongPassword {
    return Intl.message(
      'Incorrect password',
      name: 'errorWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `This email is already registered`
  String get errorEmailAlreadyInUse {
    return Intl.message(
      'This email is already registered',
      name: 'errorEmailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get errorInvalidEmail {
    return Intl.message(
      'Invalid email format',
      name: 'errorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak`
  String get errorWeakPassword {
    return Intl.message(
      'The password is too weak',
      name: 'errorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts. Please try again later`
  String get errorTooManyRequests {
    return Intl.message(
      'Too many attempts. Please try again later',
      name: 'errorTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Network connection error`
  String get errorNetworkRequestFailed {
    return Intl.message(
      'Network connection error',
      name: 'errorNetworkRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred`
  String get errorUnknown {
    return Intl.message(
      'An unknown error occurred',
      name: 'errorUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we will send you a link to reset your password.`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Enter your email address and we will send you a link to reset your password.',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `The email has been sent successfully`
  String get emailSendSuccessfully {
    return Intl.message(
      'The email has been sent successfully',
      name: 'emailSendSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Trash Classifier! 🌱`
  String get welcomeToTrashClassifier {
    return Intl.message(
      'Welcome to Trash Classifier! 🌱',
      name: 'welcomeToTrashClassifier',
      desc: '',
      args: [],
    );
  }

  /// `Statistics unavailable`
  String get statisticsUnavailable {
    return Intl.message(
      'Statistics unavailable',
      name: 'statisticsUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to see your results`
  String get signInToSeeYourResults {
    return Intl.message(
      'Sign in to see your results',
      name: 'signInToSeeYourResults',
      desc: '',
      args: [],
    );
  }

  /// `Scan history`
  String get scanHistory {
    return Intl.message(
      'Scan history',
      name: 'scanHistory',
      desc: '',
      args: [],
    );
  }

  /// `Scan history is saved only in your account.`
  String get scanHistorySaveOnlyInAccount {
    return Intl.message(
      'Scan history is saved only in your account.',
      name: 'scanHistorySaveOnlyInAccount',
      desc: '',
      args: [],
    );
  }

  /// `Friend`
  String get friend {
    return Intl.message('Friend', name: 'friend', desc: '', args: []);
  }

  /// `Hi, {name}! 👋`
  String greeting(String name) {
    return Intl.message(
      'Hi, $name! 👋',
      name: 'greeting',
      desc: 'User greeting with name',
      args: [name],
    );
  }

  /// `Your statistics`
  String get yourStatistics {
    return Intl.message(
      'Your statistics',
      name: 'yourStatistics',
      desc: '',
      args: [],
    );
  }

  /// `(Charts will be here)`
  String get chartsWillBeHere {
    return Intl.message(
      '(Charts will be here)',
      name: 'chartsWillBeHere',
      desc: '',
      args: [],
    );
  }

  /// `A list of recent scans will appear here...`
  String get lastScansWillBeHere {
    return Intl.message(
      'A list of recent scans will appear here...',
      name: 'lastScansWillBeHere',
      desc: '',
      args: [],
    );
  }

  /// `Unlock more opportunities`
  String get openMoreOpportunities {
    return Intl.message(
      'Unlock more opportunities',
      name: 'openMoreOpportunities',
      desc: '',
      args: [],
    );
  }

  /// `Create an account to save your scan history and get detailed statistics on sorted waste.`
  String get createAccountForSavingScans {
    return Intl.message(
      'Create an account to save your scan history and get detailed statistics on sorted waste.',
      name: 'createAccountForSavingScans',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message('User', name: 'user', desc: '', args: []);
  }

  /// `U`
  String get u {
    return Intl.message('U', name: 'u', desc: '', args: []);
  }

  /// `Sign out`
  String get exit {
    return Intl.message('Sign out', name: 'exit', desc: '', args: []);
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
