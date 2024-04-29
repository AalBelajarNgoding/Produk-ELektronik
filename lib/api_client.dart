// ignore_for_file: depend_on_referenced_packages

import 'package:http/http.dart' as http;

class MyApiClient {
  final http.Client httpClient;

  MyApiClient({http.Client? httpClient}) : this.httpClient = httpClient ?? http.Client();

  Future<String> fetchData() async {
    final response = await httpClient.get(Uri.parse('https://example.com'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
