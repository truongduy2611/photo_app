import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:photo_app/utils/layout.dart';

class AppSpaceBar extends StatelessWidget {
  const AppSpaceBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final leftSafeAreaPadding = media.padding.left;
    return CustomizableSpaceBar(
      builder: (context, scrollingRate) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: 12.0,
            left: leftSafeAreaPadding +
                (scrollingRate < 1 ? width / 2.5 : 0) * scrollingRate,
          ),
          child: Container(
            margin: EdgeInsets.only(
                left: context.layout.fluidGutter * (1 - scrollingRate)),
            alignment: scrollingRate < 1
                ? Alignment.bottomLeft
                : Alignment.bottomCenter,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 42 - 20 * scrollingRate),
            ),
          ),
        );
      },
    );
  }
}
