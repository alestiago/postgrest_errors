// Script used to generate the fixture for `package:postgrest_errors_scraper`
// error tests.
//
// To run this script, run the following command (from: tools/postgrest_errors_scraper):
// ```sh
// dart test/fixtures/generate_postgrest_errors_fixtures.dart
// ```
//
// Alternatively, you may use the "Run" CodeLens provided by the Dart extension
// in Visual Studio Code.
//
// **NOTE**: This script does a real HTTP request to the Postgrest website, so it may
// take a while to complete and should be used with caution to avoid a possible
// ban from the Postgrest website due to excessive requests.

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:postgrest_errors_scraper/postgrest_errors_scraper.dart';

final postgrestErrorsFixturePath = path.join(
  Directory.current.path,
  'test',
  'fixtures',
  'postgrest_errors_fixture.html',
);

void main() async {
  final response = await http.get(postgrestErrorsUri);

  File(postgrestErrorsFixturePath)
    ..createSync(recursive: true)
    ..writeAsStringSync(response.body);

  // ignore: avoid_print
  print('Fixture generated at $postgrestErrorsFixturePath');
}
