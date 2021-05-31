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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get homeAppBarTitle {
    return Intl.message(
      'Home',
      name: 'homeAppBarTitle',
      desc: 'Text shown in the AppBar of the Home Page',
      args: [],
    );
  }

  /// `Đã có lỗi xảy ra, vui lòng thử lại sau!`
  String get defaultErrorMessage {
    return Intl.message(
      'Đã có lỗi xảy ra, vui lòng thử lại sau!',
      name: 'defaultErrorMessage',
      desc: 'Text shown when an error has occurred',
      args: [],
    );
  }

  /// `Có lỗi khi kết nối máy chủ, vui lòng thử lại sau!`
  String get defaultNetworkErrorMessage {
    return Intl.message(
      'Có lỗi khi kết nối máy chủ, vui lòng thử lại sau!',
      name: 'defaultNetworkErrorMessage',
      desc: 'Text shown when an error has occurred',
      args: [],
    );
  }

  /// `Thành công!`
  String get fetchApiSuccessfully {
    return Intl.message(
      'Thành công!',
      name: 'fetchApiSuccessfully',
      desc: 'Text shown when an error has occurred',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
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
