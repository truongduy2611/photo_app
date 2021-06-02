import 'package:flutter/material.dart';
import 'package:photo_app/constants/assets.dart';
import 'package:photo_app/constants/icons.dart';
import 'package:photo_app/generated/l10n.dart';
import 'package:photo_app/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(S.current.homeAppBarTitle),
        backwardsCompatibility: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledAppButton(
              onPressed: () {},
              child: Text('Filled Button'),
            ),
            const SizedBox(height: 16),
            OutlinedAppButton(
              onPressed: () {},
              child: Text('Outlined Button'),
            ),
            Row(
              children: [
                Icon(AppIcons.back),
                Icon(AppIcons.home),
                Icon(AppIcons.comment),
                Icon(AppIcons.search),
                Icon(AppIcons.home),
              ],
            )
          ],
        ),
      ),
    );
  }
}
