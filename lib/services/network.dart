import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkUtils {
  final String url;

  NetworkUtils(this.url);

  Future getData() async {
    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      return null;
    }
  }
}
