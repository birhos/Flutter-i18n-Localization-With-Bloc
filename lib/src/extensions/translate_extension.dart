import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

extension Translate on BuildContext {
  String xTr(final String key, {final Map<String, String>? parameters}) {
    try {
      return FlutterI18n.translate(this, key, translationParams: parameters);
    } catch (_) {
      return key;
    }
  }
}

extension StringTranslate on String {
  String xTr(BuildContext context, {Map<String, String>? parameters}) {
    return context.xTr(this, parameters: parameters);
  }
}
