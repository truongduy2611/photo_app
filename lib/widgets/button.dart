import 'package:flutter/material.dart';

class FilledAppButton extends StatelessWidget {
  const FilledAppButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        minimumSize: const Size(120, 36),
      ),
      child: child,
    );
  }
}

class OutlinedAppButton extends StatelessWidget {
  const OutlinedAppButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return OutlinedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: isDark ? Colors.grey[300] : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        side: BorderSide(
          color: isDark ? Colors.grey[300]! : Colors.black,
          width: 2.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        minimumSize: const Size(120, 36),
      ),
      child: child,
    );
  }
}
