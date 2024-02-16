import 'dart:convert';
import 'dart:math';

import 'package:together_assignment/features/home/models/home_data_model.dart';
import 'package:http/http.dart' as http;

class HomeRepo {
  static Future<List<HomeDataModel>> fetchHomeData(int page) async {
    var client = http.Client();
    List<HomeDataModel> dataList = [];
    const limit = 10;
    const baseUrl = "https://api-stg.together.buzz/mocks/discovery?format=json";
    try {
      var response =
          await client.get(Uri.parse('$baseUrl&limit=$limit&page=$page'));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        List<dynamic> datas = jsonData['data'];

        for (int i = 0; i < datas.length; i++) {
          HomeDataModel data =
              HomeDataModel.fromMap(datas[i] as Map<String, dynamic>);
          dataList.add(data);
        }
        print(dataList);
        return dataList;
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      log(e.toString() as num);
      return [];
    }
  }
}
