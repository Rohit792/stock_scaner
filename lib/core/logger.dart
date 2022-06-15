import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';

var logger = Logger(printer: PrettyPrinter());

class FileOutput extends LogOutput {
  final File file;
  final bool overrideExisting;
  final Encoding encoding;
  IOSink? _sink;

  FileOutput({
    required this.file,
    this.overrideExisting = false,
    this.encoding = utf8,
  });

  @override
  void init() {
    _sink = file.openWrite(
      mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
      encoding: encoding,
    );
  }

  @override
  void output(OutputEvent event) {
    _sink?.writeAll(event.lines, '\n');
    _sink?.writeln();
    // ignore: avoid_print
    event.lines.forEach(print);
  }

  @override
  void destroy() async {
    await _sink?.flush();
    await _sink?.close();
  }
}
