import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

void run(HookContext context) {
  final dataPath = context.vars['data-path'] as String;
  final dataFile = File(path.join(Directory.current.path, dataPath));
  final data = dataFile.readAsStringSync().replaceAll('\\n', ' ');
  context.vars['data'] = jsonDecode(data);
}
