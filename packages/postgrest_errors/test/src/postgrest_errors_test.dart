// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:postgrest_errors/postgrest_errors.dart';

void main() {
  group('PostgrestErrors', () {
    test('can be instantiated', () {
      expect(PostgrestErrors(), isNotNull);
    });
  });
}
