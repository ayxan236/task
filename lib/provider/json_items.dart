import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/json.dart';

class JsonItems with ChangeNotifier {
  List<JsonModel> info = [];

   List<JsonModel> get items {
    return [...info];
  }


  Future fetchJson() async {
    const url = 'https://cdn.fonibo.com/challenges/tasks.json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<JsonModel> list =[];
      final extratedData =jsonDecode(response.body);
      extratedData.forEach((v) => list.add(JsonModel.fromJson(v)));
      info = list;
      notifyListeners();
    } else {
      throw Exception('Xeta baş verdi!!');
    }
  }
}
