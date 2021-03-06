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

  /// `Không tìm thấy trang yêu cầu!`
  String get notFoundPageMessage {
    return Intl.message(
      'Không tìm thấy trang yêu cầu!',
      name: 'notFoundPageMessage',
      desc: '',
      args: [],
    );
  }

  /// `ĐĂNG NHẬP`
  String get loginButtonText {
    return Intl.message(
      'ĐĂNG NHẬP',
      name: 'loginButtonText',
      desc: '',
      args: [],
    );
  }

  /// `ĐĂNG KÝ`
  String get registerButtonText {
    return Intl.message(
      'ĐĂNG KÝ',
      name: 'registerButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get loginTitle {
    return Intl.message(
      'Đăng nhập',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailLabel {
    return Intl.message(
      'Email',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get passwordLabel {
    return Intl.message(
      'Mật khẩu',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mật khẩu`
  String get confirmPasswordLabel {
    return Intl.message(
      'Xác nhận mật khẩu',
      name: 'confirmPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Email không đúng định dạng!`
  String get emailIsInvalidError {
    return Intl.message(
      'Email không đúng định dạng!',
      name: 'emailIsInvalidError',
      desc: '',
      args: [],
    );
  }

  /// `Email không thể để trống!`
  String get emailIsRequiredError {
    return Intl.message(
      'Email không thể để trống!',
      name: 'emailIsRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu không thể để trống!`
  String get passwordIsRequiredError {
    return Intl.message(
      'Mật khẩu không thể để trống!',
      name: 'passwordIsRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mật khẩu không đúng!`
  String get confirmPasswordIsNotMatchError {
    return Intl.message(
      'Nhập lại mật khẩu không đúng!',
      name: 'confirmPasswordIsNotMatchError',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký`
  String get registerTitle {
    return Intl.message(
      'Đăng ký',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Bằng việc nhấn đăng ký, bạn đã đồng ý Photo về `
  String get termOfServiceAndPrivacyPolicyText {
    return Intl.message(
      'Bằng việc nhấn đăng ký, bạn đã đồng ý Photo về ',
      name: 'termOfServiceAndPrivacyPolicyText',
      desc: '',
      args: [],
    );
  }

  /// `Điều kiện sử dụng dịch vụ`
  String get termOfServiceText {
    return Intl.message(
      'Điều kiện sử dụng dịch vụ',
      name: 'termOfServiceText',
      desc: '',
      args: [],
    );
  }

  /// `Chính sách bảo mật`
  String get privacyPolicyText {
    return Intl.message(
      'Chính sách bảo mật',
      name: 'privacyPolicyText',
      desc: '',
      args: [],
    );
  }

  /// `và`
  String get andText {
    return Intl.message(
      'và',
      name: 'andText',
      desc: '',
      args: [],
    );
  }

  /// `Không có dữ liệu`
  String get defaultEmptyMessage {
    return Intl.message(
      'Không có dữ liệu',
      name: 'defaultEmptyMessage',
      desc: '',
      args: [],
    );
  }

  /// `Xem thêm`
  String get seeMoreText {
    return Intl.message(
      'Xem thêm',
      name: 'seeMoreText',
      desc: '',
      args: [],
    );
  }

  /// `Khám phá`
  String get discoverTitle {
    return Intl.message(
      'Khám phá',
      name: 'discoverTitle',
      desc: '',
      args: [],
    );
  }

  /// `Duyệt qua tất cả`
  String get browseAllTitle {
    return Intl.message(
      'Duyệt qua tất cả',
      name: 'browseAllTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hôm nay có gì mới`
  String get whatsNewTodayTitle {
    return Intl.message(
      'Hôm nay có gì mới',
      name: 'whatsNewTodayTitle',
      desc: '',
      args: [],
    );
  }

  /// `Đồng ý`
  String get okTitle {
    return Intl.message(
      'Đồng ý',
      name: 'okTitle',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất`
  String get logoutButtonText {
    return Intl.message(
      'Đăng xuất',
      name: 'logoutButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản`
  String get accountTitle {
    return Intl.message(
      'Tài khoản',
      name: 'accountTitle',
      desc: '',
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
