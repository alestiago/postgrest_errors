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
  
    
      /// Could not connect with the database due to an incorrect db-uri or due to the PostgreSQL service not running.
      pgrst000._(code: 'PGRST000', httpStatus: '503', description: '''Could not connect with the database due to an incorrect db-uri or due to the PostgreSQL service not running.''',),
    
      /// Could not connect with the database due to an internal error.
      pgrst001._(code: 'PGRST001', httpStatus: '503', description: '''Could not connect with the database due to an internal error.''',),
    
      /// Could not connect with the database when building the Schema Cache due to the PostgreSQL service not running.
      pgrst002._(code: 'PGRST002', httpStatus: '503', description: '''Could not connect with the database when building the Schema Cache due to the PostgreSQL service not running.''',),
    
      /// The request timed out waiting for a pool connection to be available. See db-pool-acquisition-timeout.
      pgrst003._(code: 'PGRST003', httpStatus: '504', description: '''The request timed out waiting for a pool connection to be available. See db-pool-acquisition-timeout.''',),
    
  
    
      /// Parsing error in the query string parameter. See Horizontal Filtering, Operators and Ordering.
      pgrst100._(code: 'PGRST100', httpStatus: '400', description: '''Parsing error in the query string parameter. See Horizontal Filtering, Operators and Ordering.''',),
    
      /// For functions, only GET and POST verbs are allowed. Any other verb will throw this error.
      pgrst101._(code: 'PGRST101', httpStatus: '405', description: '''For functions, only GET and POST verbs are allowed. Any other verb will throw this error.''',),
    
      /// An invalid request body was sent(e.g. an empty body or malformed JSON).
      pgrst102._(code: 'PGRST102', httpStatus: '400', description: '''An invalid request body was sent(e.g. an empty body or malformed JSON).''',),
    
      /// An invalid range was specified for Limits and Pagination.
      pgrst103._(code: 'PGRST103', httpStatus: '416', description: '''An invalid range was specified for Limits and Pagination.''',),
    
      /// An invalid PUT request was done
      pgrst105._(code: 'PGRST105', httpStatus: '405', description: '''An invalid PUT request was done''',),
    
      /// The schema specified when switching schemas is not present in the db-schemas configuration variable.
      pgrst106._(code: 'PGRST106', httpStatus: '406', description: '''The schema specified when switching schemas is not present in the db-schemas configuration variable.''',),
    
      /// The Content-Type sent in the request is invalid.
      pgrst107._(code: 'PGRST107', httpStatus: '415', description: '''The Content-Type sent in the request is invalid.''',),
    
      /// The filter is applied to a embedded resource that is not specified in the select part of the query string. See Embedded Filters.
      pgrst108._(code: 'PGRST108', httpStatus: '400', description: '''The filter is applied to a embedded resource that is not specified in the select part of the query string. See Embedded Filters.''',),
    
      /// Restricting a Deletion or an Update using limits must include the ordering of a unique column. See Limited Update&#x2F;Delete.
      pgrst109._(code: 'PGRST109', httpStatus: '400', description: '''Restricting a Deletion or an Update using limits must include the ordering of a unique column. See Limited Update&#x2F;Delete.''',),
    
      /// When restricting a Deletion or an Update using limits modifies more rows than the maximum specified in the limit. See Limited Update&#x2F;Delete.
      pgrst110._(code: 'PGRST110', httpStatus: '400', description: '''When restricting a Deletion or an Update using limits modifies more rows than the maximum specified in the limit. See Limited Update&#x2F;Delete.''',),
    
      /// An invalid response.headers was set. See Response Headers.
      pgrst111._(code: 'PGRST111', httpStatus: '500', description: '''An invalid response.headers was set. See Response Headers.''',),
    
      /// The status code must be a positive integer. See Response Status Code.
      pgrst112._(code: 'PGRST112', httpStatus: '500', description: '''The status code must be a positive integer. See Response Status Code.''',),
    
      /// More than one column was returned for a scalar result. See Scalar Function Response Format.
      pgrst113._(code: 'PGRST113', httpStatus: '406', description: '''More than one column was returned for a scalar result. See Scalar Function Response Format.''',),
    
      /// For an UPSERT using PUT, when limits and offsets are used.
      pgrst114._(code: 'PGRST114', httpStatus: '400', description: '''For an UPSERT using PUT, when limits and offsets are used.''',),
    
      /// For an UPSERT using PUT, when the primary key in the query string and the body are different.
      pgrst115._(code: 'PGRST115', httpStatus: '400', description: '''For an UPSERT using PUT, when the primary key in the query string and the body are different.''',),
    
      /// More than 1 or no items where returned when requesting a singular response. See Singular or Plural.
      pgrst116._(code: 'PGRST116', httpStatus: '406', description: '''More than 1 or no items where returned when requesting a singular response. See Singular or Plural.''',),
    
      /// The HTTP verb used in the request in not supported.
      pgrst117._(code: 'PGRST117', httpStatus: '405', description: '''The HTTP verb used in the request in not supported.''',),
    
      /// Could not order the result using the related table because there is no many-to-one or one-to-one relationship between them.
      pgrst118._(code: 'PGRST118', httpStatus: '400', description: '''Could not order the result using the related table because there is no many-to-one or one-to-one relationship between them.''',),
    
      /// Could not use the spread operator on the related table because there is no many-to-one or one-to-one relationship between them.
      pgrst119._(code: 'PGRST119', httpStatus: '400', description: '''Could not use the spread operator on the related table because there is no many-to-one or one-to-one relationship between them.''',),
    
      /// An embedded resource can only be filtered using the is.null or not.is.null operators.
      pgrst120._(code: 'PGRST120', httpStatus: '400', description: '''An embedded resource can only be filtered using the is.null or not.is.null operators.''',),
    
  
    
      /// Caused by stale foreign key relationships, otherwise any of the embedding resources or the relationship itself may not exist in the database.
      pgrst200._(code: 'PGRST200', httpStatus: '400', description: '''Caused by stale foreign key relationships, otherwise any of the embedding resources or the relationship itself may not exist in the database.''',),
    
      /// An ambiguous embedding request was made. See Foreign Key Joins on Multiple Foreign Key Relationships.
      pgrst201._(code: 'PGRST201', httpStatus: '300', description: '''An ambiguous embedding request was made. See Foreign Key Joins on Multiple Foreign Key Relationships.''',),
    
      /// Caused by a stale function signature, otherwise the function may not exist in the database.
      pgrst202._(code: 'PGRST202', httpStatus: '404', description: '''Caused by a stale function signature, otherwise the function may not exist in the database.''',),
    
      /// Caused by requesting overloaded functions with the same argument names but different types, or by using a POST verb to request overloaded functions with a JSON or JSONB type unnamed parameter. The solution is to rename the function or add&#x2F;modify the names of the arguments.
      pgrst203._(code: 'PGRST203', httpStatus: '300', description: '''Caused by requesting overloaded functions with the same argument names but different types, or by using a POST verb to request overloaded functions with a JSON or JSONB type unnamed parameter. The solution is to rename the function or add&#x2F;modify the names of the arguments.''',),
    
      /// Caused when the column specified in the columns query parameter is not found.
      pgrst204._(code: 'PGRST204', httpStatus: '400', description: '''Caused when the column specified in the columns query parameter is not found.''',),
    
  
    
      /// A JWT secret is missing from the configuration.
      pgrst300._(code: 'PGRST300', httpStatus: '500', description: '''A JWT secret is missing from the configuration.''',),
    
      /// Any error related to the verification of the JWT, which means that the JWT provided is invalid in some way.
      pgrst301._(code: 'PGRST301', httpStatus: '401', description: '''Any error related to the verification of the JWT, which means that the JWT provided is invalid in some way.''',),
    
      /// Attempted to do a request without authentication when the anonymous role is disabled by not setting it in db-anon-role.
      pgrst302._(code: 'PGRST302', httpStatus: '401', description: '''Attempted to do a request without authentication when the anonymous role is disabled by not setting it in db-anon-role.''',),
    
  
    
      /// Internal errors related to the library used for connecting to the database.
      pgrstx00._(code: 'PGRSTX00', httpStatus: '500', description: '''Internal errors related to the library used for connecting to the database.''',),
    
  
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


  
/// {@template Pgrst000Exception}
/// Could not connect with the database due to an incorrect db-uri or due to the PostgreSQL service not running.
/// {@endtemplate}
class PostgrestPgrst000Exception extends PostgrestException {
  /// {@macro Pgrst000Exception}
  PostgrestPgrst000Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST000');
}
  
/// {@template Pgrst001Exception}
/// Could not connect with the database due to an internal error.
/// {@endtemplate}
class PostgrestPgrst001Exception extends PostgrestException {
  /// {@macro Pgrst001Exception}
  PostgrestPgrst001Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST001');
}
  
/// {@template Pgrst002Exception}
/// Could not connect with the database when building the Schema Cache due to the PostgreSQL service not running.
/// {@endtemplate}
class PostgrestPgrst002Exception extends PostgrestException {
  /// {@macro Pgrst002Exception}
  PostgrestPgrst002Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST002');
}
  
/// {@template Pgrst003Exception}
/// The request timed out waiting for a pool connection to be available. See db-pool-acquisition-timeout.
/// {@endtemplate}
class PostgrestPgrst003Exception extends PostgrestException {
  /// {@macro Pgrst003Exception}
  PostgrestPgrst003Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST003');
}
  

  
/// {@template Pgrst100Exception}
/// Parsing error in the query string parameter. See Horizontal Filtering, Operators and Ordering.
/// {@endtemplate}
class PostgrestPgrst100Exception extends PostgrestException {
  /// {@macro Pgrst100Exception}
  PostgrestPgrst100Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST100');
}
  
/// {@template Pgrst101Exception}
/// For functions, only GET and POST verbs are allowed. Any other verb will throw this error.
/// {@endtemplate}
class PostgrestPgrst101Exception extends PostgrestException {
  /// {@macro Pgrst101Exception}
  PostgrestPgrst101Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST101');
}
  
/// {@template Pgrst102Exception}
/// An invalid request body was sent(e.g. an empty body or malformed JSON).
/// {@endtemplate}
class PostgrestPgrst102Exception extends PostgrestException {
  /// {@macro Pgrst102Exception}
  PostgrestPgrst102Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST102');
}
  
/// {@template Pgrst103Exception}
/// An invalid range was specified for Limits and Pagination.
/// {@endtemplate}
class PostgrestPgrst103Exception extends PostgrestException {
  /// {@macro Pgrst103Exception}
  PostgrestPgrst103Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST103');
}
  
/// {@template Pgrst105Exception}
/// An invalid PUT request was done
/// {@endtemplate}
class PostgrestPgrst105Exception extends PostgrestException {
  /// {@macro Pgrst105Exception}
  PostgrestPgrst105Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST105');
}
  
/// {@template Pgrst106Exception}
/// The schema specified when switching schemas is not present in the db-schemas configuration variable.
/// {@endtemplate}
class PostgrestPgrst106Exception extends PostgrestException {
  /// {@macro Pgrst106Exception}
  PostgrestPgrst106Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST106');
}
  
/// {@template Pgrst107Exception}
/// The Content-Type sent in the request is invalid.
/// {@endtemplate}
class PostgrestPgrst107Exception extends PostgrestException {
  /// {@macro Pgrst107Exception}
  PostgrestPgrst107Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST107');
}
  
/// {@template Pgrst108Exception}
/// The filter is applied to a embedded resource that is not specified in the select part of the query string. See Embedded Filters.
/// {@endtemplate}
class PostgrestPgrst108Exception extends PostgrestException {
  /// {@macro Pgrst108Exception}
  PostgrestPgrst108Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST108');
}
  
/// {@template Pgrst109Exception}
/// Restricting a Deletion or an Update using limits must include the ordering of a unique column. See Limited Update&#x2F;Delete.
/// {@endtemplate}
class PostgrestPgrst109Exception extends PostgrestException {
  /// {@macro Pgrst109Exception}
  PostgrestPgrst109Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST109');
}
  
/// {@template Pgrst110Exception}
/// When restricting a Deletion or an Update using limits modifies more rows than the maximum specified in the limit. See Limited Update&#x2F;Delete.
/// {@endtemplate}
class PostgrestPgrst110Exception extends PostgrestException {
  /// {@macro Pgrst110Exception}
  PostgrestPgrst110Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST110');
}
  
/// {@template Pgrst111Exception}
/// An invalid response.headers was set. See Response Headers.
/// {@endtemplate}
class PostgrestPgrst111Exception extends PostgrestException {
  /// {@macro Pgrst111Exception}
  PostgrestPgrst111Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST111');
}
  
/// {@template Pgrst112Exception}
/// The status code must be a positive integer. See Response Status Code.
/// {@endtemplate}
class PostgrestPgrst112Exception extends PostgrestException {
  /// {@macro Pgrst112Exception}
  PostgrestPgrst112Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST112');
}
  
/// {@template Pgrst113Exception}
/// More than one column was returned for a scalar result. See Scalar Function Response Format.
/// {@endtemplate}
class PostgrestPgrst113Exception extends PostgrestException {
  /// {@macro Pgrst113Exception}
  PostgrestPgrst113Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST113');
}
  
/// {@template Pgrst114Exception}
/// For an UPSERT using PUT, when limits and offsets are used.
/// {@endtemplate}
class PostgrestPgrst114Exception extends PostgrestException {
  /// {@macro Pgrst114Exception}
  PostgrestPgrst114Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST114');
}
  
/// {@template Pgrst115Exception}
/// For an UPSERT using PUT, when the primary key in the query string and the body are different.
/// {@endtemplate}
class PostgrestPgrst115Exception extends PostgrestException {
  /// {@macro Pgrst115Exception}
  PostgrestPgrst115Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST115');
}
  
/// {@template Pgrst116Exception}
/// More than 1 or no items where returned when requesting a singular response. See Singular or Plural.
/// {@endtemplate}
class PostgrestPgrst116Exception extends PostgrestException {
  /// {@macro Pgrst116Exception}
  PostgrestPgrst116Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST116');
}
  
/// {@template Pgrst117Exception}
/// The HTTP verb used in the request in not supported.
/// {@endtemplate}
class PostgrestPgrst117Exception extends PostgrestException {
  /// {@macro Pgrst117Exception}
  PostgrestPgrst117Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST117');
}
  
/// {@template Pgrst118Exception}
/// Could not order the result using the related table because there is no many-to-one or one-to-one relationship between them.
/// {@endtemplate}
class PostgrestPgrst118Exception extends PostgrestException {
  /// {@macro Pgrst118Exception}
  PostgrestPgrst118Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST118');
}
  
/// {@template Pgrst119Exception}
/// Could not use the spread operator on the related table because there is no many-to-one or one-to-one relationship between them.
/// {@endtemplate}
class PostgrestPgrst119Exception extends PostgrestException {
  /// {@macro Pgrst119Exception}
  PostgrestPgrst119Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST119');
}
  
/// {@template Pgrst120Exception}
/// An embedded resource can only be filtered using the is.null or not.is.null operators.
/// {@endtemplate}
class PostgrestPgrst120Exception extends PostgrestException {
  /// {@macro Pgrst120Exception}
  PostgrestPgrst120Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST120');
}
  

  
/// {@template Pgrst200Exception}
/// Caused by stale foreign key relationships, otherwise any of the embedding resources or the relationship itself may not exist in the database.
/// {@endtemplate}
class PostgrestPgrst200Exception extends PostgrestException {
  /// {@macro Pgrst200Exception}
  PostgrestPgrst200Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST200');
}
  
/// {@template Pgrst201Exception}
/// An ambiguous embedding request was made. See Foreign Key Joins on Multiple Foreign Key Relationships.
/// {@endtemplate}
class PostgrestPgrst201Exception extends PostgrestException {
  /// {@macro Pgrst201Exception}
  PostgrestPgrst201Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST201');
}
  
/// {@template Pgrst202Exception}
/// Caused by a stale function signature, otherwise the function may not exist in the database.
/// {@endtemplate}
class PostgrestPgrst202Exception extends PostgrestException {
  /// {@macro Pgrst202Exception}
  PostgrestPgrst202Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST202');
}
  
/// {@template Pgrst203Exception}
/// Caused by requesting overloaded functions with the same argument names but different types, or by using a POST verb to request overloaded functions with a JSON or JSONB type unnamed parameter. The solution is to rename the function or add&#x2F;modify the names of the arguments.
/// {@endtemplate}
class PostgrestPgrst203Exception extends PostgrestException {
  /// {@macro Pgrst203Exception}
  PostgrestPgrst203Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST203');
}
  
/// {@template Pgrst204Exception}
/// Caused when the column specified in the columns query parameter is not found.
/// {@endtemplate}
class PostgrestPgrst204Exception extends PostgrestException {
  /// {@macro Pgrst204Exception}
  PostgrestPgrst204Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST204');
}
  

  
/// {@template Pgrst300Exception}
/// A JWT secret is missing from the configuration.
/// {@endtemplate}
class PostgrestPgrst300Exception extends PostgrestException {
  /// {@macro Pgrst300Exception}
  PostgrestPgrst300Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST300');
}
  
/// {@template Pgrst301Exception}
/// Any error related to the verification of the JWT, which means that the JWT provided is invalid in some way.
/// {@endtemplate}
class PostgrestPgrst301Exception extends PostgrestException {
  /// {@macro Pgrst301Exception}
  PostgrestPgrst301Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST301');
}
  
/// {@template Pgrst302Exception}
/// Attempted to do a request without authentication when the anonymous role is disabled by not setting it in db-anon-role.
/// {@endtemplate}
class PostgrestPgrst302Exception extends PostgrestException {
  /// {@macro Pgrst302Exception}
  PostgrestPgrst302Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRST302');
}
  

  
/// {@template Pgrstx00Exception}
/// Internal errors related to the library used for connecting to the database.
/// {@endtemplate}
class PostgrestPgrstx00Exception extends PostgrestException {
  /// {@macro Pgrstx00Exception}
  PostgrestPgrstx00Exception._({
    required super.message,
    super.hint,
    super.details,
  }) : super(code: 'PGRSTX00');
}
  

