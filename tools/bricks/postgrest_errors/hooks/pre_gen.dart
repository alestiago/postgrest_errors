import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

void run(HookContext context) {
  final projectRoot = Directory.current;
  final dataPath = path.join(projectRoot.path, 'data', 'errors.json');
  final dataFile = File(dataPath);
  final data = dataFile.readAsStringSync().replaceAll('\\n', ' ');
  context.vars['data'] = jsonDecode(data);
}
