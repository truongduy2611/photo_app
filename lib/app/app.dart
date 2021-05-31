import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:photo_app/generated/l10n.dart';
import 'package:photo_app/repositories/photo/repository.dart';
import 'package:photo_app/routes/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PhotoRepository(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.amber,
          accentColor: Colors.amber[400],
          backgroundColor: Colors.white,
        ),
        localizationsDelegates: const [
          ...GlobalMaterialLocalizations.delegates,
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.initialRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}