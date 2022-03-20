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

Future<dynamic> moneyOut() async {
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

Future<dynamic> moneyCheck() async {
  final response = await http
      .get(Uri.parse('https://www.induced.me/api/moneycheck?userid=123'));

  if (response.statusCode == 200) {
    // print(response.body);
    String stats = json.decode(response.body)["stats"];
    // print(balance +" "+stats);
    return stats;

  } else {
    return {"stats":"Page Not Found"};
  }
}

Future<dynamic> moneyTrans() async {
  final response = await http
      .get(Uri.parse('https://www.induced.me/api/moneytrans?userid=123'));

  if (response.statusCode == 200) {
    dynamic list = json.decode(response.body)["transiction"];
    var Cr = 0;
    var Dr = 0;
    for (var i = 0; i < list.length; i++) {
      if(list[i]['type'] == 'CR'){
        Cr++;
      }
      if(list[i]['type'] == 'DR'){
        Dr++;
      }
    }
    return [Cr, Dr];
    // print(list);

    return json.decode(response.body);

  } else {
    return {"stats":"Page Not Found"};
  }
}
