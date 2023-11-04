import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:postgrest_errors_scraper/postgrest_errors_scraper.dart';

/// Will scrape the PostgREST errors and update the static JSON data file.
void main() async {
  final client = http.Client();
  final groups = await scrapePostgrestErrors(client: client);

  final jsonGroups = groups.map((e) => e.toJson()).toList();
  final json = jsonEncode(jsonGroups);

  final projectRoot = Directory.current.parent.parent;
  final filePath = path.join(
    projectRoot.path,
    'data',
    'errors.json',
  );
  File(filePath)
    ..createSync(recursive: true)
    ..writeAsStringSync(json);
}
