# PostgREST errors

![coverage](https://img.shields.io/badge/coverage-100-gree)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

A generated collection of all [PostgREST errors](https://postgrest.org/en/stable/references/errors.html#postgrest-error-codes) errors definitions in Dart.

## Usage

### Accessing raw PostgREST error data

The `PostgrestError` enhanced enumeration provides all documented PostgREST Errors with their code, HTTP Status and description.

```dart
PostgrestError.pgrst001.code; // PGRST001
PostgrestError.pgrst001.httpStatus; // 503
PostgrestError.pgrst001.description; // The server is currently unavailable (because it is overloaded or down for maintenance). Generally, this is a temporary state.
```

### Parsing incoming PostgREST exceptions

Easily parse an incoming PostgREST error response with `PostgrestError.fromJson`.

```dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:postgrest_errors/postgrest_errors.dart';

void main() async {
  // Make a request to PostgREST server:
  final client = http.Client();
  final response = await client.get(
    Uri.parse('http://localhost:3000'), // PostgREST server
  );

  // Parse the response:
  if (response.statusCode != 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    throw PostgrestError.fromJson(json);
  }
}
```
