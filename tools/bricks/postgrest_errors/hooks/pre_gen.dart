import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

/// A human readable alias for error codes.
///
/// This are non-official aliases for error codes, and have been deduced from
/// the error descriptions.
///
/// Those error codes starting with a 0 are related to a connection error with
/// the database, and their aliases are prefixed with `Connection`.
///
/// Those error codes starting with a 1 are related HTTP request elements, and
/// their aliases are prefixed with `Request`.
///
/// Those error codes starting with a 2 are related to a stale schema cache, and
/// their aliases are prefixed with `Schema`.
///
/// Those error codes starting with a 3 are related to related to the
/// authentication process using JWT, and their aliases are prefixed with `Jwt`.
Map<String, String> _codeToAlias = {
  '000': 'ConnectionIncorrectUri',
  '001': 'ConnectionInternal',
  '002': 'ConnectionSchemaBuild',
  '003': 'ConnectionPoolAcquisitionTimeout',
  '100': 'RequestQueryParsingError',
  '101': 'RequestNotAllowedVerb',
  '102': 'RequestInvalidBody',
  '103': 'RequestInvalidRange',
  '105': 'RequestInvalidPut',
  '106': 'RequestInvalidSchema',
  '107': 'RequestInvalidContentType',
  '108': 'RequestMissingSelectedEmbeddedResource',
  '109': 'RequestMissingLimitedColumnOrdering',
  '110': 'RequestOverMaximumRowLimitRestriction',
  '111': 'RequestInvalidResponseHeader',
  '112': 'RequestNegativeResponseStatusCode',
  '113': 'RequestMoreThanOneColumnFromScalarResult',
  '114': 'Request',
  '115': 'RequestDifferentPrimaryKeyAndQueryString',
  '116': 'RequestNotSingularItem',
  '117': 'RequestNotSupportedVerb',
  '200': 'SchemaStaleForeignKeyRelationship',
  '201': 'SchemaAmbiguousEmbedding',
  '202': 'SchemaStaleFunctionSignature',
  '203': 'SchemaOverloadedFunction',
  '204': 'SchemaColumnNotFound',
  '300': 'JwtMissingSecret',
  '301': 'JwtVerification',
  '302': 'JwtDisabledAnonymousAuthentication',
  'X00': 'Internal',
};

void run(HookContext context) {
  final projectRoot = Directory.current;
  final dataPath = path.join(projectRoot.path, 'data', 'errors.json');
  final dataFile = File(dataPath);
  final data = dataFile.readAsStringSync().replaceAll('\\n', ' ');
  context.vars['data'] = jsonDecode(data);

  final aliases = <Map<String, String>>[];
  for (final alias in _codeToAlias.entries) {
    aliases.add({
      'code': alias.key,
      'alias': alias.value,
    });
  }
  context.vars['aliases'] = aliases;
}
