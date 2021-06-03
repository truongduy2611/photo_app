import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photo_app/constants/assets.dart';
import 'package:photo_app/routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      /// TODO: handle init app
      /// or use firebase singleton to change the default route
      Future.delayed(
        const Duration(seconds: 2),
        () {
          if (FirebaseAuth.instance.currentUser != null) {
            Navigator.popAndPushNamed(context, Routes.loggedInRoot);
          } else {
            Navigator.popAndPushNamed(context, Routes.logout);
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 256,
          width: 256,
          child: Image.asset(Assets.logoTransparent),
        ),
      ),
    );
  }
}
