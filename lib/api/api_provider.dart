import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

/// A class that provides methods to interact with a Restful API.
class ApiProvider {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  /// Function to get the api
  Future<dynamic> getApi(String endPoint) async {
    try {
      final url = Uri.parse("$baseUrl/$endPoint");
      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "User-Agent": "Flutter-App"
        },
      );
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        return decoded;
      } else {
        debugPrint("API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      debugPrint("API Error: $e");
      return null;
    }
  }
}
