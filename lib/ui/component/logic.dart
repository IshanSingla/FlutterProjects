import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// String balance = '';
Future<dynamic> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://www.induced.me/api/moneyin?userid=123&amount=10'));

  if (response.statusCode == 200) {
    String balance = json.decode(response.body)["ballence"];
    String stats = json.decode(response.body)["stats"];
    // print(balance +" "+stats);
    return balance;

  } else {
    return {"stats":"Page Not Found"};
  }
}

dynamic moneyout() async {
  final response = await http
      .get(Uri.parse('https://www.induced.me/api/moneyout?userid=123&amount=10'));

  if (response.statusCode == 200) {
    String balance = json.decode(response.body)["ballence"];
    String stats = json.decode(response.body)["stats"];
    // print(balance +" "+stats);
    return balance;

  } else {
    return {"stats":"Page Not Found"};
  }
}

dynamic moneycheck() async {
  final response = await http
      .get(Uri.parse('https://www.induced.me/api/moneycheck?userid=123'));

  if (response.statusCode == 200) {
    String stats = json.decode(response.body)["stats"];
    // print(balance +" "+stats);
    return stats;

  } else {
    return {"stats":"Page Not Found"};
  }
}

dynamic moneytrans() async {
  final response = await http
      .get(Uri.parse('https://www.induced.me/api/moneytrans?userid=123'));

  if (response.statusCode == 200) {
    return json.decode(response.body);

  } else {
    return {"stats":"Page Not Found"};
  }
}
