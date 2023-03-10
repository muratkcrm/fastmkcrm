import 'package:fastmkcrm/constants.dart';
import 'package:fastmkcrm/models/userapi.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

const urlapi = url;

class Userapi_provider with ChangeNotifier {
  List<Userapi> userapis = [];

  getUserapis() async {
    final urll = Uri.http(urlapi, 'api/Users');
    final resp = await http.get(urll, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'Application/json',
      'Accept': 'application/json',
    });
    final response = userapiFromJson(resp.body);
    userapis = response;
    notifyListeners();
  }
}
