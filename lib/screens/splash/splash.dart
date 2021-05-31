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
      // TODO: initial app loading
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, Routes.home);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 54,
          width: 206,
          child: Image.asset(Assets.logo),
        ),
      ),
    );
  }
}