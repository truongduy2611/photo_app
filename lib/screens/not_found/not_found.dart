import 'package:flutter/material.dart';
import 'package:photo_app/generated/l10n.dart';
import 'package:photo_app/widgets/error_container.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ErrorContainer(
          message: S.current.notFoundPageMessage,
        ),
      ),
    );
  }
}
