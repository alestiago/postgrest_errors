import 'package:postgrest_errors/postgrest_errors.dart';

{{#aliases}}
/// A human readable type definition for [Postgrest{{#pascalCase}}{{code}}{{/pascalCase}}Exception].
typedef Postgrest{{#pascalCase}}{{alias}}{{/pascalCase}}Exception = Postgrest{{#pascalCase}}{{code}}{{/pascalCase}}Exception;
{{/aliases}}