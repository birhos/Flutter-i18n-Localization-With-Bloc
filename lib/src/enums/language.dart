import 'package:flutter/material.dart';

enum Language {
  TR,
  EN,
}

extension LanguageExtension on Language {
  Locale get xGetLocale {
    switch (this) {
      case Language.TR:
        return Locale("tr", "TR");

      case Language.EN:
        return Locale("en", "US");
    }
  }
}
