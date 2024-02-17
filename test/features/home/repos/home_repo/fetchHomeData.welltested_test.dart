import 'fetchHomeData.welltested_test.mocks.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart' as http_testing;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:together_assignment/features/home/models/home_data_model.dart';
import 'package:together_assignment/features/home/repos/home_repo.dart';

@GenerateMocks([http.Client])
void main() {
  group('HomeRepo', () {
    late MockClient client;

    setUp(() {
      client = MockClient();
    });

    test(
        'returns a List of HomeDataModel when the http call completes successfully',
        () async {
      const mockResponse =
          '{"data":[{"id":1,"title":"Sample Item 1","description":"This is the description for Sample Item 1.","image_url":"https://together-web-assets.s3.ap-south-1.amazonaws.com/event_card_placeholder_app.png"},{"id":2,"title":"Sample Item 2","description":"This is the description for Sample Item 2.","image_url":"https://together-web-assets.s3.ap-south-1.amazonaws.com/event_card_placeholder_app.png"},{"id":3,"title":"Sample Item 3","description":"This is the description for Sample Item 3.","image_url":"https://together-web-assets.s3.ap-south-1.amazonaws.com/event_card_placeholder_app.png"},{"id":4,"title":"Sample Item 4","description":"This is the description for Sample Item 4.","image_url":"https://together-web-assets.s3.ap-south-1.amazonaws.com/event_card_placeholder_app.png"},{"id":5,"title":"Sample Item 5","description":"This is the description for Sample Item 5.","image_url":"https://together-web-assets.s3.ap-south-1.amazonaws.com/event_card_placeholder_app.png"},{"id":6,"title":"Sample Item 6","description":"This is the description for Sample Item 6.","image_url":"https://together-web-assets.s3.ap-south-1.amazonaws.com/event_card_placeholder_app.png"},{"id":7,"title":"Sample Item 7","description":"This is the description for Sample Item 7.","image_url":"https://together-web-assets.s3.ap-south-1.amazonaws.com/event_card_placeholder_app.png"},{"id":8,"title":"Sample Item 8","description":"This is the description for Sample Item 8.","image_url":"https://together-web-assets.s3.ap-south-1.amazonaws.com/event_card_placeholder_app.png"},{"id":9,"title":"Sample Item 9","description":"This is the description for Sample Item 9.","image_url":"https://together-web-assets.s3.ap-south-1.amazonaws.com/event_card_placeholder_app.png"},{"id":10,"title":"Sample Item 10","description":"This is the description for Sample Item 10.","image_url":"https://together-web-assets.s3.ap-south-1.amazonaws.com/event_card_placeholder_app.png"}]}';
      final expectedData = [
        HomeDataModel.fromMap(jsonDecode(mockResponse)['data'][0])
      ];

      when(client.get(any))
          .thenAnswer((_) async => http.Response(mockResponse, 200));

      expect(await HomeRepo.fetchHomeData(1), equals(expectedData));
    });

    test('throws an exception when the http call completes with an error',
        () async {
      when(client.get(any))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() async => await HomeRepo.fetchHomeData(1), throwsException);
    });
  });
}
