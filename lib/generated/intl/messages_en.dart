// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "andText": MessageLookupByLibrary.simpleMessage("and"),
        "confirmPasswordIsNotMatchError": MessageLookupByLibrary.simpleMessage(
            "Confirm password is not match!"),
        "confirmPasswordLabel": MessageLookupByLibrary.simpleMessage("Confirm"),
        "defaultErrorMessage": MessageLookupByLibrary.simpleMessage(
            "An error has occured, please try again later!"),
        "defaultNetworkErrorMessage":
            MessageLookupByLibrary.simpleMessage("No internet connection!"),
        "emailIsInvalidError":
            MessageLookupByLibrary.simpleMessage("Email is invalid!"),
        "emailIsRequiredError":
            MessageLookupByLibrary.simpleMessage("Email is required!"),
        "emailLabel": MessageLookupByLibrary.simpleMessage("Email"),
        "fetchApiSuccessfully":
            MessageLookupByLibrary.simpleMessage("Successfully!"),
        "homeAppBarTitle": MessageLookupByLibrary.simpleMessage("Home"),
        "loginButtonText": MessageLookupByLibrary.simpleMessage("LOGIN"),
        "loginTitle": MessageLookupByLibrary.simpleMessage("Log in"),
        "notFoundPageMessage":
            MessageLookupByLibrary.simpleMessage("Not found page!"),
        "passwordIsRequiredError":
            MessageLookupByLibrary.simpleMessage("Password is required!"),
        "passwordLabel": MessageLookupByLibrary.simpleMessage("Password"),
        "privacyPolicyText":
            MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "registerButtonText": MessageLookupByLibrary.simpleMessage("REGISTER"),
        "registerTitle": MessageLookupByLibrary.simpleMessage("Register"),
        "termOfServiceAndPrivacyPolicyText":
            MessageLookupByLibrary.simpleMessage(
                "By signing up, you agree to Photo’s "),
        "termOfServiceText":
            MessageLookupByLibrary.simpleMessage("Terms of Service")
      };
}
