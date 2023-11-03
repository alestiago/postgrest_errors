// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:postgrest_errors_scraper/postgrest_errors_scraper.dart';

void main() {
  group('PostgrestErrorsScraper', () {
    test('can be instantiated', () {
      expect(PostgrestErrorsScraper(), isNotNull);
    });
  });
}
