import 'package:flutter/material.dart';
import 'package:photo_app/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.homeAppBarTitle),
      ),
      body: Container(),
    );
  }
}
