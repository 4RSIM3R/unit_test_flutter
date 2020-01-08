import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:unit_testing/model/responseModel.dart';
import 'package:unit_testing/service/apiService.dart';
import 'package:unit_testing/service/failureService.dart';

class MockApiService extends Mock implements ApiService{} 

void main() {
  // TODO : Write Some Test For Http Request
  //In short, mocking is creating objects that simulate the behaviour of real objects
  group("Http Request Test Basic", () {
    test("Check Data When Request Is Successfully", () async {
      final apiService = ApiService();
      // TODO : Here Some Fake Http Request Made It With Mock Client
      // MockClient is a special client provided by the http/testing.dart package
      // which will imitate a HTTP request but will never make a real request to the server.
      apiService.client = MockClient((request) async {
        final mapJson = {'id': 123};
        return http.Response(json.encode(mapJson), 200);
      });
      final item = await apiService.getSomeData();
      expect(item.id, equals(123));
    });
    test("Other Test", () async {
      final apiService = MockApiService();
      ResponseModel responseModel = ResponseModel(
          userId: 1,
          id: 1,
          title:
              "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
          body:
              "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto");
      // In Fact : ERROR: Bad state: Mock method was not called within `when()`. Was a real method called?
      // DONT USE A REAL CLASS WHEN YOU USING MOCKITO !!
      when(apiService.getSomeData()).thenAnswer((_) => Future.value(responseModel));
      expect(await apiService.getSomeData(), equals(responseModel));
    });
    test("Throw Some Exception", () async {
      final apiService = MockApiService();
      apiService.url = "https://jsonplaceholder.typicode.com/posts/9000";
      // Simulate An Bad Response Format
      when(apiService.getSomeData()).thenThrow("Bad response format 👎");
      expect(() => apiService.getSomeData(), throwsException);
    });
  });
}
