import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:postgrest_errors/postgrest_errors.dart';

void main() async {
  /// Parsing incoming PostgREST exceptions
  final client = http.Client();
  final response = await client.get(
    Uri.parse('http://localhost:3000'), // PostgREST server
  );
  if (response.statusCode != 200) {
    final errorJson = jsonDecode(response.body) as Map<String, dynamic>;
    throw PostgrestError.fromJsonAsPostgrestException(errorJson);
  }

  /// Accessing raw PostgREST error data
  PostgrestError.pgrst001.code; // PGRST001
  PostgrestError.pgrst001.httpStatus; // 503
  PostgrestError.pgrst001
      .description; // The server is currently unavailable (because it is overloaded or down for maintenance). Generally, this is a temporary state.
}
