import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:postgrest_errors/postgrest_errors.dart';

void main() async {
  // Make a request to PostgREST server:
  final client = http.Client();
  final response = await client.get(
    Uri.parse('http://localhost:3000'), // PostgREST server
  );

  // Parse the response error as a Dart exception:
  if (response.statusCode != 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    throw PostgrestError.fromJson(json);
  }
}
