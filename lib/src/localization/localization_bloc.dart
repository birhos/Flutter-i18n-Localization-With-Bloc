import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../enums/language.dart';

class LanguageBloc extends Bloc<Language, Locale> {
  LanguageBloc() : super(Language.TR.xGetLocale);

  @override
  Stream<Locale> mapEventToState(Language event) async* {
    yield event.xGetLocale;
  }
}
