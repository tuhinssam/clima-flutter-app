import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper({this.url});

  Future getData() async {
    http.Response response = await http.get(url);
    //print(response.body);
    print('statuscode: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('StatusCode: ' + response.statusCode.toString());
    }
  }
}
