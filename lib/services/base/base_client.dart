import 'dart:io';

import 'package:flutter/rendering.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:karmalab_assignment/constants/network_constants.dart';
import 'package:karmalab_assignment/services/base/app_exceptions.dart';

class BaseClient {
  var client = http.Client();

  // get method
  Future<dynamic> get(String api) async {}
  // post method
  Future<dynamic> post(String api, dynamic object, {dynamic header}) async {
    var payload = jsonEncode(object);
    var url = Uri.parse(NetworkConstants.baseURL + api);

    try {
      var response = await client.post(url, body: payload, headers: header);
      var result = utf8.decode(response.bodyBytes);

      debugPrint(result);
      // if (response.statusCode == 201 || response.statusCode == 200) {
      //   return result;
      // } else {
      //   // throw exception
      //   return {
      //     "status": false,
      //     "message": "something went wrong",
      //   };
      // }
    } on SocketException {
      // throw Exception();
    } catch (e) {
      debugPrint("something went wrong");
    }
  }

  // put method
  Future<dynamic> put(String api) async {}

  dynamic _processResponse(http.Response response) {
    var bodyBytes = utf8.decode(response.bodyBytes);
    switch (response.statusCode) {
      case 200:
        var responseJson = bodyBytes;
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(bodyBytes, response.request?.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            bodyBytes, response.request?.url.toString());
      case 500:
      default:
        throw FetchDataException(
            "Error occur with code : ${response.statusCode}",
            response.request?.url.toString());
    }
  }
}
