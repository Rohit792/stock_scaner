// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:stock_scan_parser/utils/enum.dart';

class Utils {
  static showAppMessage(
      BuildContext context, String? message, MessageDurationType durationType) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      content: Text(
        message ?? 'Try again later',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 17, color: Theme.of(context).colorScheme.onSurface),
      ),
      dismissDirection: DismissDirection.up,
      duration: durationType == MessageDurationType.veryLow
          ? const Duration(milliseconds: 500)
          : durationType == MessageDurationType.low
              ? const Duration(milliseconds: 700)
              : durationType == MessageDurationType.medium
                  ? const Duration(seconds: 3)
                  : const Duration(seconds: 3),
    ));
  }
}
