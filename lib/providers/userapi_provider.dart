import 'package:fastmkcrm/models/userapi.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

final urlapi = url;

class Userapi_provider with ChangeNotifier{
  List<Userapi> userapis = [];

  getUserapis() async {
    final urll = Uri.http(urlapi, 'api/Users');
    final resp = await http.get(urll, headers: {
      "Access-Control-Allow-Origin":"*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'Application/json',
      'Accept': 'Application/json',
    });
    final response = userapiFromJson(resp.body);
    userapis = response as List<Userapi>;
    notifyListeners();
  }
}