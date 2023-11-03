// ignore_for_file: lines_longer_than_80_chars, avoid_unused_constructor_parameters

import 'package:postgrest/postgrest.dart';

/// A function that builds a [PostgrestException].
typedef PostgrestExceptionBuilder = PostgrestException Function({
  required String message,
  dynamic details,
  String? hint,
});

/// An error thrown by PostgREST.
enum PostgrestError {
  {{#data}}
    {{#errors}}
      /// {{{description}}}
      pgrst{{#lowerCase}}{{code}}{{/lowerCase}}._(code: 'PGRST{{code}}', httpStatus: '{{httpStatus}}', description: '''{{{description}}}''',),
    {{/errors}}
  {{/data}}
  ;

  const PostgrestError._({
    required this.code,
    required this.httpStatus,
    required this.description,
  });

  /// The error code.
  final String code;

  /// The HTTP status code.
  final String httpStatus;

  /// The error description.
  final String description;

  static final _codeToExceptionBuilder = <String, PostgrestExceptionBuilder>{
{{#data}}
  {{#errors}}
    'PGRST{{code}}': Postgrest{{#pascalCase}}{{code}}{{/pascalCase}}Exception._,
  {{/errors}}
{{/data}}
  };

  /// Returns a [PostgrestException] from a [json] response.
  ///
  /// The function signature matches [PostgrestException.fromJson].
  static PostgrestException fromJsonAsPostgrestException(
    Map<String, dynamic> json, {
    String? message,
    int? code,
    String? details,
  }) {
    final exceptionMessage = (json['message'] ?? message) as String;
    final exceptionCode = (json['code'] ?? '$code') as String?;
    final exceptionDetails = (json['details'] ?? details) as dynamic;
    final exceptionHint = json['hint'] as String?;

    final exceptionBuilder = _codeToExceptionBuilder[exceptionCode];
    if (exceptionBuilder != null) {
      return exceptionBuilder(
        message: exceptionMessage,
        details: exceptionDetails,
        hint: exceptionHint,
      );
    }

    return PostgrestException(
      message: exceptionMessage,
      code: exceptionCode,
      details: exceptionDetails,
      hint: exceptionHint,
    );
  }
}

{{#data}}
  {{#errors}}
/// {@template Postgrest{{#pascalCase}}{{code}}{{/pascalCase}}Exception}
/// {{description}}
/// {@endtemplate}
class Postgrest{{#pascalCase}}{{code}}{{/pascalCase}}Exception extends PostgrestException {
  /// {@macro {{#pascalCase}}{{code}}{{/pascalCase}}Exception}
  Postgrest{{#pascalCase}}{{code}}{{/pascalCase}}Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST{{code}}');
}
  {{/errors}}
{{/data}}
