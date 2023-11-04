import 'package:postgrest_errors/postgrest_errors.dart';
import 'package:test/test.dart';

void main() {
  group('PostgrestError', () {
    group('fromJson', () {
      test('returns a raw PostgresException when code is not found', () {
        final exception = PostgrestError.fromJson(
          {'code': 'not_found'},
        );
        expect(exception, isA<PostgrestException>());
      });
{{#data}}
  {{#errors}}
      test('returns a Postgrest{{#pascalCase}}{{code}}{{/pascalCase}}Exception when code is found', () {
        final exception = PostgrestError.fromJson(
          {'code': PostgrestError.pgrst{{#pascalCase}}{{code}}{{/pascalCase}}.code},
        );
        expect(exception, isA<Postgrest{{#pascalCase}}{{code}}{{/pascalCase}}Exception>());
      });
  {{/errors}}
{{/data}}
    });
  });

{{#data}}
  {{#errors}}
  group('Postgrest{{#pascalCase}}{{code}}{{/pascalCase}}Exception', () {
    test('can be instantiated', () {
      expect(
        Postgrest{{#pascalCase}}{{code}}{{/pascalCase}}Exception(
          message: 'message',
          details: 'details',
          hint: 'hint',
        ),
        isA<Postgrest{{#pascalCase}}{{code}}{{/pascalCase}}Exception>(),
      );
    });

    test('code is correct', () {
      final exception = Postgrest{{#pascalCase}}{{code}}{{/pascalCase}}Exception(message: 'message');
      final code = PostgrestError.pgrst{{#pascalCase}}{{code}}{{/pascalCase}}.code;
      expect(exception.code, code);
    });
  });
  {{/errors}}
{{/data}}
}
