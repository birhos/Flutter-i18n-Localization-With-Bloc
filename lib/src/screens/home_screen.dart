import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../enums/language.dart';
import '../extensions/translate_extension.dart';
import '../localization/localeKeys.dart';
import '../localization/localization_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: Text(context.xTr('locale')),
        actions: <Widget>[
          _buildButton('TR', Language.TR),
          _buildButton('EN', Language.EN),
        ],
      ),

      //
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //
            Text(LocaleKeys.helloWorld.xTr(context)),

            //
            Localizations.override(
              context: context,
              locale: Language.EN.xGetLocale,
              child: Builder(
                builder: (BuildContext context) {
                  return Text(
                    context.xTr('helloWorld'),
                  );
                },
              ),
            ),

            //
            Text(
              context.xTr(
                'greeting',
                parameters: {
                  'hello': 'Hello',
                  'world': 'Hello',
                },
              ),
            ),

            //
            Text(
              context.xTr(
                'numberOfDataPoints',
                parameters: {
                  'value': 1200000.toString(),
                },
              ),
            ),

            //
            Text(
              context.xTr(
                'helloWorldOn',
                parameters: {
                  'date': DateTime.utc(1997, 04, 01).toString(),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String title, Language language) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(
          title,
        ),
        onPressed: () {
          BlocProvider.of<LanguageBloc>(context).add(language);
        },
      ),
    );
  }
}
