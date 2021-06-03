import 'package:flutter/material.dart';
import 'package:photo_app/constants/icons.dart';
import 'package:photo_app/generated/l10n.dart';

class EmptyContainer extends StatelessWidget {
  const EmptyContainer({Key? key, this.message}) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          AppIcons.search,
          size: 32,
        ),
        const SizedBox(height: 16),
        Text(message ?? S.current.defaultEmptyMessage),
      ],
    );
  }
}
