import 'dart:convert';
import 'dart:io';

import '../../core/app_exception.dart';
import '../../core/base_service.dart';
import 'package:http/http.dart' as http;

class RandomService extends BaseService {
  dynamic responseJson;

  @override
  Future getResponse(String url) async {
    try {
      final String requestUrl = baseUrl + url;
      final response = await http.get(Uri.parse(requestUrl));
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception("Internet error");
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 401:
        throw UnauthorizedException(response.statusCode.toString());
      case 404:
        throw InvalidInputException(response.statusCode.toString());
      default:
        throw Exception(response.statusCode.toString());
    }
  }
}