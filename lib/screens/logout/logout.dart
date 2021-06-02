import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_app/constants/assets.dart';
import 'package:photo_app/generated/l10n.dart';
import 'package:photo_app/routes/routes.dart';
import 'package:photo_app/widgets/button.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Material(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(Assets.background1),
                Center(
                  child: Image.asset(
                    Assets.logoName,
                    height: 54,
                    width: 206,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedAppButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.login);
                        },
                        child: Text(S.current.loginButtonText),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: FilledAppButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.register);
                        },
                        child: Text(S.current.registerButtonText),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
