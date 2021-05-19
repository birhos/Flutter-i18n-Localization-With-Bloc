import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/localization/localization_bloc.dart';
import 'src/screens/home_screen.dart';

// https://github.com/ilteoood/flutter_i18n/blob/master/example/lib/basic_example.dart
// https://github.com/ilteoood/flutter_i18n/blob/master/lib/utils/message_printer.dart

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    BlocProvider<LanguageBloc>(
      create: (_) => LanguageBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, Locale>(
      builder: (BuildContext context, Locale state) {
        return MaterialApp(
          title: 'Sample Localization',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            FlutterI18nDelegate(
              translationLoader: FileTranslationLoader(
                useCountryCode: false,
                basePath: 'assets/flutter_i18n',
                forcedLocale: state,
              ),
            ),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          locale: state,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}

