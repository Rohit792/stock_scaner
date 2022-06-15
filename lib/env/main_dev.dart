import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stock_scan_parser/app/app.dart';
import 'package:stock_scan_parser/core/common_setup.dart';
import 'package:stock_scan_parser/env/flavour_config.dart';

Future<void> main() async {
  const values = FlavorValues(
    baseUrl: 'https://mobile-app-challenge.herokuapp.com/',
    logNetworkInfo: true,
    authProvider: ' ',
  );

  FlavorConfig(
    flavor: Flavor.dev,
    name: 'DEV',
    color: Colors.white,
    values: values,
  );
  await commonSetup();
  runApp(const MyApp());
}
