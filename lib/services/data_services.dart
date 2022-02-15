import 'dart:convert';

import 'package:coffee_app/model/data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseURL = 'https://api.sampleapis.com';

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/coffee/hot';
    http.Response res = await http.get(Uri.parse(baseURL + apiUrl));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        var c = list.map((e) => DataModel.fromJson(e)).toList();
        print(c);
        return c;
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return <DataModel>[];
    }
  }
}
