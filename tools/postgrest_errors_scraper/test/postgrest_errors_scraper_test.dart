import 'dart:io';
import 'package:postgrest_errors_scraper/postgrest_errors_scraper.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as html_dom;
import 'package:html/parser.dart' as html_parser;

import 'fixtures/generate_postgrest_errors_fixture.dart';

class _MockClient extends Mock implements http.Client {}

class _MockResponse extends Mock implements http.Response {}

final _fixtureFileContent = File(postgrestErrorsFixturePath).readAsStringSync();

/// All the selectors used to scrape the Postgrest errors, that when missing
/// should throw a [PostgrestErrorsScraperException].
const _querySelectors = {
  '#postgrest-error-codes',
  '#group-0-connection',
  '#group-1-api-request',
  '#group-2-schema-cache',
  '#group-3-jwt',
  '#group-x-internal',
  'table',
  'tbody',
  'td',
  'p',
  'h4',
};

void main() {
  group('PostgrestErrorsScraperException', () {
    test('can be instantiated', () {
      expect(
        PostgrestErrorsScraperException('message'),
        isA<PostgrestErrorsScraperException>(),
      );
    });

    test('toString includes class name and message', () {
      expect(
        PostgrestErrorsScraperException('message').toString(),
        equals('PostgrestErrorsScraperException: message'),
      );
    });
  });

  group('PostgrestError', () {
    test('can be instantiated', () {
      expect(
        PostgrestError(
          code: 'code',
          httpStatus: 'httpStatus',
          description: 'description',
        ),
        isA<PostgrestError>(),
      );
    });

    test('toJson composes Map correctly', () {
      final error = PostgrestError(
        code: 'code',
        httpStatus: 'httpStatus',
        description: 'description',
      );

      final json = error.toJson();

      expect(
        json,
        equals({
          'code': 'code',
          'httpStatus': 'httpStatus',
          'description': 'description',
        }),
      );
    });
  });

  group('PostgrestErrorGroup', () {
    test('can be instantiated', () {
      expect(
        PostgrestErrorGroup(
          name: 'name',
          description: 'description',
          errors: [],
        ),
        isA<PostgrestErrorGroup>(),
      );
    });

    test('fromJson composes Map correctly', () {
      final error = PostgrestError(
        code: 'code',
        httpStatus: 'httpStatus',
        description: 'description',
      );
      final errorGroup = PostgrestErrorGroup(
        name: 'name',
        description: 'description',
        errors: [error],
      );

      final json = errorGroup.toJson();

      expect(
        json,
        equals({
          'name': 'name',
          'description': 'description',
          'errors': [error.toJson()],
        }),
      );
    });
  });

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
        () => scrapePostgrestErrors(client: client),
        returnsNormally,
      );
    });

    test('returns non empty Set', () async {
      final result = await scrapePostgrestErrors(client: client);
      expect(result, isNotEmpty);
    });

    group('throws', () {
      test('when response is not successful', () async {
        when(() => response.statusCode).thenReturn(500);

        final errorMessage =
            '''Request to "$postgrestErrorsUri" failed with status code "${response.statusCode}"''';
        await expectLater(
          () => scrapePostgrestErrors(client: client),
          throwsA(isA<PostgrestErrorsScraperException>().having(
            (exception) => exception.message,
            'message',
            equals(errorMessage),
          )),
        );
      });

      test('when HTML parser fails', () {
        final htmlParser = (
          dynamic input, {
          String? encoding,
          bool generateSpans = false,
          String? sourceUrl,
        }) {
          throw Exception('HTML parser failed');
        };
        expect(
          () => scrapePostgrestErrors(
            client: client,
            htmlParser: htmlParser,
          ),
          throwsA(
            isA<PostgrestErrorsScraperException>().having(
              (exception) => exception.message,
              'message',
              equals('Failed to parse the HTML document'),
            ),
          ),
        );
      });

      group('when missing a querySelector', () {
        for (final selector in _querySelectors) {
          test('when missing "$selector"', () async {
            final document =
                html_parser.parse(_fixtureFileContent).removeAll([selector]);

            when(() => response.body).thenReturn(document.outerHtml);

            when(() => response.body).thenReturn(document.outerHtml);

            await expectLater(
              () => scrapePostgrestErrors(client: client),
              throwsA(isA<PostgrestErrorsScraperException>()),
            );
          });
        }
      });
    });
  });
}

extension on html_dom.Document {
  /// Removes all the elements matching the given [selectors].
  html_dom.Document removeAll(Iterable<String> selectors) {
    for (final selector in selectors) {
      final elements = querySelectorAll(selector);
      print('selector: $selector, isEmpty: ${elements.isEmpty}');
      for (final element in elements) {
        element.remove();
      }
    }

    return this;
  }
}
