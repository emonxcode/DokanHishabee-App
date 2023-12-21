

import '../constants/enums.dart';

extension SupportedLocalExtension on SupportedLocale {
  String get code => this.toString().split('.').last;
  String get name {
    String name;
    switch (this) {
      case SupportedLocale.en:
        name = 'English';
        break;
      case SupportedLocale.bn:
        name = 'Bangla';
        break;
    }
    return name;
  }
}
