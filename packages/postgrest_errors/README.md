[<img src="https://raw.githubusercontent.com/alestiago/postgrest_errors/b4d4f6422e3d5f61bba5582b3d6b7ffbfb1fcb9f/packages/postgrest_errors/assets/logo.png" width="65px" align="left"/>](https://cli.vgv.dev/)

# PostgREST errors

[![ci](https://img.shields.io/github/actions/workflow/status/alestiago/postgrest_errors/postgrest_errors_package.yaml)](https://github.com/alestiago/postgrest_errors/actions)
![coverage](https://img.shields.io/badge/coverage-100-green)
[![pub package](https://img.shields.io/pub/v/postgrest_errors.svg)](https://pub.dev/packages/postgrest_errors)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

---

A generated typed collection of all [PostgREST error](https://postgrest.org/en/stable/references/errors.html#postgrest-error-codes) definitions in Dart.

## Usage 🧑‍💻

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
