import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_list/model/list_model.dart';

class PeopleInfoService {
  Future<List<People>> loadPeopleInfo() async {
    Uri uri = "YOUR_URI" as Uri;
    print(uri);

    var response = await http.get(uri);

    if(response.body != null && response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      if(body['result'] != null){
        List<dynamic> list = body['result'];
        return list.map<People>((item) => People.fromJson(item)).toList();
      }
    }
  }
}