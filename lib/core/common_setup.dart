// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:logger/logger.dart' hide FileOutput;
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

import 'package:stock_scan_parser/injection_container.dart' as di;

// import 'logger.dart';

Future commonSetup() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  // setupLogger();
}

// Future<void> setupLogger() async {
//   var dirPath = await getApplicationSupportDirectory();
//   var filePath = join(dirPath.path, 'AppLogFile.txt');
//   final file = File(filePath);
//   logger = Logger(
//       printer: PrettyPrinter(methodCount: 0, noBoxingByDefault: true),
//       output: FileOutput(file: file));
// }
