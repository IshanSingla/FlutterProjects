import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

dynamic fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://www.induced.me/api/moneyin?userid=123&amount=10'));

  if (response.statusCode == 200) {
    print(response.body);
    return json.decode(response.body);

  } else {
    return {"stats":"Page Not Found"};
  }
}

