import 'dart:convert';
import 'dart:math';

import 'package:together_assignment/features/home/models/home_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:welltested_annotation/welltested_annotation.dart';

class HomeRepo {
  static final http.Client _client = http.Client();
  static const int _limit = 10;
  static const String _baseUrl =
      "https://api-stg.together.buzz/mocks/discovery?format=json";

  static Future<List<HomeDataModel>> fetchHomeData(int page) async {
    List<HomeDataModel> dataList = [];

    try {
      final response =
          await _client.get(Uri.parse('$_baseUrl&limit=$_limit&page=$page'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final datas = jsonData['data'] as List<dynamic>;

        for (final data in datas) {
          final homeData = HomeDataModel.fromMap(data as Map<String, dynamic>);
          dataList.add(homeData);
        }

        return dataList;
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      // Handle exceptions
      print("Error fetching home data: $e");
      return [];
    }
  }
}
