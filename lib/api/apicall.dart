import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/datamodel.dart';

// https://reqres.in/api/users?page=1

class DataRepo {

  Future<PageData> getData() async {
    var res = await http.get(Uri.parse("https://www.playerline.org/test/static-endpoint/api/newslist/0.json"));
    return PageData.fromJson(jsonDecode(res.body));
  }
  
}
