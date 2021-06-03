import 'package:flutter/material.dart';
import 'package:photo_app/generated/l10n.dart';
import 'package:photo_app/routes/routes.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(
            context,
            Routes.logout,
          );
        },
        child: Text(S.current.logoutButtonText.toUpperCase()),
      ),
    ));
  }
}
