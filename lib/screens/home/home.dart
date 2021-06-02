import 'package:flutter/material.dart';
import 'package:photo_app/generated/l10n.dart';
import 'package:photo_app/widgets/app_space_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 128,
            pinned: true,
            flexibleSpace: AppSpaceBar(
              title: S.current.homeAppBarTitle,
            ),
          )
        ],
      ),
    );
  }
}
