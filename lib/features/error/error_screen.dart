import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String? errorMessage;
  const ErrorScreen({Key? key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage ?? "No data available",
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
