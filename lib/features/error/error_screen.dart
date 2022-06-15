import 'package:flutter/material.dart';
import 'package:stock_scan_parser/generated/l10n.dart';

class ErrorScreen extends StatelessWidget {
  final String? errorMessage;
  const ErrorScreen({Key? key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage ?? S.current.no_data_available,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
