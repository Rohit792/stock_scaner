import 'package:stock_scan_parser/core/app_localizations.dart';

extension StringLocalization on String {
  String get localizedString {
    return AppLocalizations.instance.translate(this);
  }
}
