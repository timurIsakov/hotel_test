import 'dart:convert';

import 'package:http/http.dart';

import 'api_constants.dart';
import 'api_exceptions.dart';

class ApiClient {
  final Client client;

  ApiClient(this.client);

  Future get(String path, Map<String, dynamic> params) async {
    final Map<String, String> header = {};

    final response =
        await client.get(getPath(path, params: params), headers: header);

    return _errorHandler(response);
  }

  _errorHandler(Response response) {
    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
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

    return Uri.parse('${ApiConstants.tBaseUrl}$path$paramsString');
  }
}
