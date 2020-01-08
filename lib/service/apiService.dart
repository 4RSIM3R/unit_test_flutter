import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'package:unit_testing/model/responseModel.dart';
import 'package:http/http.dart' as http;
import 'package:unit_testing/service/failureService.dart';

class ApiService {
  Client client = Client();
  String _url = "https://jsonplaceholder.typicode.com/posts/1";
  set url(String newUrl) => _url = newUrl;
  Future<ResponseModel> getSomeData() async {
    try {
      final response = await client
          .get(_url)
          .timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        return responseModelFromJson(response.body);
      }
    } on SocketException {
      throw FailureService(message: 'No Internet connection 😑');
    } on TimeoutException {
      throw FailureService(message: "😢 Hmmm Timeout Connection");
    } on HttpException {
      throw FailureService(message: "Couldn't find the post 😱");
    } on FormatException {
      throw FailureService(message: "Bad response format 👎");
    }
  }
}
