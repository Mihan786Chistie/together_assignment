import 'dart:convert';
import 'dart:math';

import 'package:together_assignment/features/home/models/home_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:welltested_annotation/welltested_annotation.dart';

class HomeRepo {
  static final http.Client _client = http.Client();
  // Define constants for API parameters
  static const int _limit = 10;
  static const String _baseUrl =
      "https://api-stg.together.buzz/mocks/discovery?format=json";

  // Define a static method to fetch home data from the API
  static Future<List<HomeDataModel>> fetchHomeData(int page) async {
    // Initialize an empty list to store fetched data
    List<HomeDataModel> dataList = [];

    try {
      // Send GET request to the API with specified parameters
      final response =
          await _client.get(Uri.parse('$_baseUrl&limit=$_limit&page=$page'));

      // Check if the response status code is successful
      if (response.statusCode == 200) {
        // Parse JSON response
        final jsonData = jsonDecode(response.body);
        // Extract the 'data' field from the response
        final datas = jsonData['data'] as List<dynamic>;

        // Iterate over each data item and map it to a HomeDataModel object
        for (final data in datas) {
          final homeData = HomeDataModel.fromMap(data as Map<String, dynamic>);
          dataList.add(homeData);
        }

        // Return the list of fetched HomeDataModel objects
        return dataList;
      } else {
        // Throw an exception if the response status code is not successful
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      // Handle exceptions by printing error message and returning an empty list
      print("Error fetching home data: $e");
      return [];
    }
  }
}
