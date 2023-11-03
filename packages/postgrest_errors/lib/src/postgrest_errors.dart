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
  /// Could not connect with the database due to an incorrect db-uri or due to an internal error.
  pgrst001._(
    code: 'PGRST001',
    httpStatus: '503',
    description:
        '''Could not connect with the database due to an internal error.''',
  );

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
    'PGRST001': Postgrest001Exception._,
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

/// {@template Postgrest001Exception}
/// Could not connect with the database due to an internal error.
/// {@endtemplate}
class Postgrest001Exception extends PostgrestException {
  /// {@macro Postgrest001Exception}
  Postgrest001Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: PostgrestError.pgrst001.code);
}
