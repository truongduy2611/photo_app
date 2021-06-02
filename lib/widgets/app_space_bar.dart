import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter/material.dart';

class AppSpaceBar extends StatelessWidget {
  const AppSpaceBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CustomizableSpaceBar(
      builder: (context, scrollingRate) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: 12.0,
            left: 16.0 + (scrollingRate < 1 ? width / 2.5 : 0) * scrollingRate,
          ),
          child: Align(
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
