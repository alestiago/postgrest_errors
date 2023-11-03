import 'dart:convert';
import 'dart:io';

import 'package:html/dom.dart' as html_dom;
import 'package:html/parser.dart' as html_parser;
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:meta/meta.dart';

/// {@template PostgrestErrorsScraperException}
/// An exception thrown when PostgrestErrorsScraper fails.
/// {@endtemplate}
class PostgrestErrorsScraperException implements Exception {
  /// {@macro PostgrestErrorsScraperException}
  PostgrestErrorsScraperException(this.message);

  /// A descriptive message of the error.
  final String message;

  @override
  String toString() => 'PostgrestErrorsScraperException: $message';
}

/// {@template _PostgrestError}
/// A Postgrest error.
///
/// See also:
///
/// * [PostgREST Error Codes](https://postgrest.org/en/stable/references/errors.html#postgrest-error-codes)
/// {@endtemplate}
class PostgrestError {
  /// {@macro _PostgrestError}
  const PostgrestError({
    required this.code,
    required this.httpStatus,
    required this.description,
  });

  /// Parses a [PostgrestError] from an HTML [element].
  ///
  /// The [element] should have the following structure:
  ///
  /// ```html
  /// <tr>
  ///   <td>Code</td>
  ///   <td>HTTP Status</td>
  ///   <td>Description</td>
  /// </tr>
  /// ```
  factory PostgrestError.fromElement(html_dom.Element element) {
    const tableDataElementSelector = 'td';
    final tableDataElements = element.querySelectorAll(
      tableDataElementSelector,
    );
    if (tableDataElements.length != 3) {
      throw PostgrestErrorsScraperException(
        '''Expected 3 "$tableDataElementSelector" elements, but found ${tableDataElements.length}''',
      );
    }

    final code = tableDataElements[0].text.trim();
    final httpStatus = tableDataElements[1].text.trim();
    final description = tableDataElements[2].text.trim();

    return PostgrestError(
      code: code,
      httpStatus: httpStatus,
      description: description,
    );
  }

  /// The error code.
  final String code;

  /// The HTTP status code.
  final String httpStatus;

  /// A description of the error.
  final String description;

  /// Converts the [PostgrestError] to a JSON encodable [Map].
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'httpStatus': httpStatus,
      'description': description,
    };
  }
}

/// {@template _PostgrestErrorGroup}
/// A group of Postgrest errors.
/// {@endtemplate}
class PostgrestErrorGroup {
  /// {@macro _PostgrestErrorGroup}
  const PostgrestErrorGroup({
    required this.name,
    required this.description,
    required this.errors,
  });

  /// Parses a [PostgrestErrorGroup] from an HTML [element].
  ///
  /// The [element] should have the following structure:
  ///
  /// ```html
  /// <div>
  ///  <h4>Name</h4>
  ///  <p>Description</p>
  ///  <table>
  ///    <tbody>
  ///      <tr>
  ///        <td>Code</td>
  ///        <td>HTTP Status</td>
  ///        <td>Description</td>
  ///      </tr>
  ///    </tbody>
  ///  </table>
  /// </div>
  /// ```
  factory PostgrestErrorGroup.fromElement(html_dom.Element element) {
    const headingElementSelector = 'h4';
    final headingElement = element.querySelector(headingElementSelector);
    if (headingElement == null) {
      throw PostgrestErrorsScraperException(
        'Failed to find the "$headingElementSelector" element',
      );
    }
    final name = headingElement.text.trim();

    const paragraphElementSelector = 'p';
    final paragraphElement = element.querySelector(paragraphElementSelector);
    if (paragraphElement == null) {
      throw PostgrestErrorsScraperException(
        'Failed to find the "$paragraphElementSelector" element',
      );
    }
    final description = paragraphElement.text.trim();

    const tableElementSelector = 'table';
    final tableElement = element.querySelector(tableElementSelector);
    if (tableElement == null) {
      throw PostgrestErrorsScraperException(
        'Failed to find the "$tableElementSelector" element',
      );
    }

    const tableBodyElementSelector = 'tbody';
    final tableBodyElement = tableElement.querySelector(
      tableBodyElementSelector,
    );
    if (tableBodyElement == null) {
      throw PostgrestErrorsScraperException(
        'Failed to find the "$tableBodyElementSelector" element',
      );
    }

    const tableRowElementSelector = 'tr';
    final tableRowElements = tableBodyElement.querySelectorAll(
      tableRowElementSelector,
    );
    final errors = <PostgrestError>[];
    for (final tableRowElement in tableRowElements) {
      errors.add(PostgrestError.fromElement(tableRowElement));
    }

    return PostgrestErrorGroup(
      name: name,
      description: description,
      errors: errors,
    );
  }

  /// The name of the group.
  final String name;

  /// A description of the group.
  final String description;

  /// The errors in the group.
  final Iterable<PostgrestError> errors;

  /// Converts the [PostgrestErrorGroup] to a JSON encodable [Map].
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'errors': errors.map((e) => e.toJson()).toList(),
    };
  }
}

/// The URI to scrape the PostgREST errors from.
final postgrestErrorsUri = Uri.parse(
  'https://postgrest.org/en/stable/references/errors.html#postgrest-error-codes',
);

/// Scrapes PostgREST errors from [postgrestErrorsUri].
///
/// The retrieved HTML document should have the following structure:
/// ```html
/// <div id="postgrest-error-codes">
///  <div id="group-0-connection" ></div>
///  <div id="group-1-api-request"></div>
/// <div id="group-2-schema-cache"></div>
///  <div id="group-3-jwt"></div>
///  <div id="group-x-internal"></div>
/// </div>
/// ```
Future<Set<PostgrestErrorGroup>> scrapePostgrestErrors({
  @visibleForTesting http.Client? clientOverride,
}) async {
  final client = clientOverride ?? http.Client();

  final request = await client.get(postgrestErrorsUri);

  if (request.statusCode != 200) {
    throw PostgrestErrorsScraperException(
      '''Request to "$postgrestErrorsUri" failed with status code "${request.statusCode}"''',
    );
  }

  late final html_dom.Document document;
  try {
    document = html_parser.parse(request.body);
  } catch (e) {
    throw PostgrestErrorsScraperException(
      'Failed to parse the HTML document',
    );
  }

  const errorCodesElementSelector = '#postgrest-error-codes';
  final errorCodesElement = document.querySelector(errorCodesElementSelector);
  if (errorCodesElement == null) {
    throw PostgrestErrorsScraperException(
      'Failed to find the "$errorCodesElementSelector" div',
    );
  }

  final groupsElementSelector = {
    "#group-0-connection",
    "#group-1-api-request",
    "#group-2-schema-cache",
    "#group-3-jwt",
    "#group-x-internal",
  };
  final groups = <PostgrestErrorGroup>{};
  for (final groupElementSelector in groupsElementSelector) {
    final groupElement = errorCodesElement.querySelector(groupElementSelector);
    if (groupElement == null) {
      throw PostgrestErrorsScraperException(
        'Failed to find the "$groupElementSelector" div',
      );
    }

    final group = PostgrestErrorGroup.fromElement(groupElement);
    groups.add(group);
  }

  return groups;
}

/// Will scrape the PostgREST errors and update the static JSON data file.
void main() async {
  final groups = await scrapePostgrestErrors();

  final jsonGroups = groups.map((e) => e.toJson()).toList();
  final json = jsonEncode(jsonGroups);

  final projectRoot = Directory.current.parent.parent;
  final filePath = path.join(
    projectRoot.path,
    'data',
    'errors.json',
  );
  File(filePath)
    ..createSync(recursive: true)
    ..writeAsStringSync(json);
}
