import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
};
var response = http.get(Uri.https(
  'www.induced.me',
  '/api/moneyin',
      {
        'userid': 1234,
        'amount': 20,
      },);

if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
}


