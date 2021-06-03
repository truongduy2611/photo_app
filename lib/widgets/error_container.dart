import 'package:flutter/material.dart';
import 'package:photo_app/generated/l10n.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({Key? key, this.message}) : super(key: key);
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline_rounded,
          size: 32,
          color: Theme.of(context).errorColor,
        ),
        const SizedBox(height: 16),
        Text(message ?? S.current.defaultErrorMessage),
      ],
    );
  }
}
