import 'dart:convert';

import 'package:http/http.dart';

import 'api_exceptions.dart';

class ApiClient {
  final Client client;

  ApiClient(this.client);

  Future get(String path) async {
    final response = await client.get(getPath(
      path,
    ));

    return _errorHandler(response);
  }

  _errorHandler(Response response) {
    if (response.statusCode == 200) {
      // print("reponse body ${response.body}");
      return json.decode(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 404) {
      String msg = "unknown_error";
      var resp = jsonDecode(utf8.decode(response.bodyBytes));

      if (resp.containsKey("error")) {
        msg = resp["error"];
      } else if (resp.containsKey("message")) {
        var rsp = resp["message"];
        if (rsp.runtimeType == String) msg = resp["message"];
        if (rsp.runtimeType == List) msg = rsp[0];
      } else {
        msg = utf8
            .decode(response.bodyBytes)
            .replaceAll("[", '')
            .replaceAll("]", '')
            .replaceAll("}", '')
            .replaceAll("{", '')
            .replaceAll("\\", '');
      }
      throw ExceptionWithMessage(msg);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath(String path, {Map<dynamic, dynamic>? params}) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return Uri.parse('$path$paramsString');
  }
}
