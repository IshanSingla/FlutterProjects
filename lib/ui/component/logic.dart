import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();


  Future<List<Video>> search({required String word}) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    var response = http.get(Uri.https(
        'www.induced.me',
        '/api/moneyin',
        {
          'userid': 1234,
          'amount': 20,
        }),);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
    }
  }
}


