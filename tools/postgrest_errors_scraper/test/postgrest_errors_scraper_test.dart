import 'dart:io';

import 'package:postgrest_errors_scraper/postgrest_errors_scraper.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import 'fixtures/generate_postgrest_errors_fixture.dart';

class _MockClient extends Mock implements http.Client {}

class _MockResponse extends Mock implements http.Response {}

final _fixtureFileContent = File(postgrestErrorsFixturePath).readAsStringSync();

void main() {
  group('scrapePostgrestErrors', () {
    late http.Client client;
    late http.Response response;

    setUp(() {
      response = _MockResponse();
      when(() => response.statusCode).thenReturn(200);
      when(() => response.body).thenReturn(_fixtureFileContent);

      client = _MockClient();
      when(() => client.get(postgrestErrorsUri)).thenAnswer(
        (_) async => response,
      );
    });

    test('returns normally', () async {
      await expectLater(
        () => scrapePostgrestErrors(clientOverride: client),
        returnsNormally,
      );
    });

    test('returns not empty Set', () async {
      final result = await scrapePostgrestErrors(clientOverride: client);
      expect(result, isNotEmpty);
    });

    group('throws', () {
      test('when response is not successful', () async {
        when(() => response.statusCode).thenReturn(500);

        final errorMessage =
            '''Request to "$postgrestErrorsUri" failed with status code "${response.statusCode}"''';
        await expectLater(
          () => scrapePostgrestErrors(clientOverride: client),
          throwsA(isA<PostgrestErrorsScraperException>().having(
            (exception) => exception.message,
            'message',
            equals(errorMessage),
          )),
        );
      });
    });
  });
}
