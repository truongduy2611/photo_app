import 'package:flutter/material.dart';

class MiniCircularProgressIndicator extends StatelessWidget {
  const MiniCircularProgressIndicator({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      width: 16,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        color: color ?? Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
