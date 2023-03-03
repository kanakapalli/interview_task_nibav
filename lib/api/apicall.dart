import 'dart:convert';

import 'package:apiintergrations/datamodel.dart';
import 'package:http/http.dart' as http;

// https://reqres.in/api/users?page=1

class DataRepo {
  Future<PageData> getData() async {
    var res = await http.get(Uri.parse("https://www.playerline.org/test/static-endpoint/api/newslist/0.json"));
    print("res :::::::: ${res.body.toString()}");

    var returnData = PageData.fromJson(jsonDecode(res.body));
    print("res :::::::: 111 9 ");

    return returnData;
  }
}
