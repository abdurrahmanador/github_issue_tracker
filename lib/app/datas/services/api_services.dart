import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {

  final String baseUrl = "https://api.github.com/repos/flutter/flutter/issues";//base_url

  Future<List<dynamic>?> fetchIssues(int perPage, int page) async {

    String url = "$baseUrl?per_page=$perPage&page=$page";//url_including_pagination_

    try {
      var response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10)); //timeout_for_exception
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      else if (response.statusCode == 404) {
        throw Exception("Repository not found (404).");
      }
      else if (response.statusCode == 500) {
        throw Exception("Server error (500). Please try again later.");
      } else {
        throw Exception("Failed to fetch data! Status Code: ${response.statusCode}");
      }
    }

    on http.ClientException catch (e) {
      throw Exception("Client error occurred");
    } on TimeoutException {
      throw Exception("Request timed out. Please check your internet connection.");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }
}
