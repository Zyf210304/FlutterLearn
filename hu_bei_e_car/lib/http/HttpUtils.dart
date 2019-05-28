import 'package:dio/dio.dart';
import 'dart:convert';

class HttpUtils {
  static Dio _dio;

  HttpUtils() {
    BaseOptions options = new BaseOptions(
      method: "POST",
      connectTimeout: 60 * 1000,
      receiveTimeout: 10 * 1000,
    );
    _dio = new Dio(options);
  }

  /// get
  get(String url, Map<String, Object> map, Function successCallback,
      Function failureCallback) {
    _dio.get(url, queryParameters: map).then((response) {
      _parseJSON(response.data, successCallback, failureCallback);
    });
  }

  /// post
  post(String url, Map<String, dynamic> map, Function success,
      Function failure) {
    _dio.post(url, data: map).then((response) {
      print(response.data);
      _parseJSON(response.data, success, failure);
    });
  }

  Future<Map<String, dynamic>> postData(String url) async {
    Response response = await _dio.post(url);
    var map = json.decode(response.data);
    var res = map["response"];
    var status = res["status"];

    int code = status['code'];
    if (code == 100) {
      // 成功
      Map<String, dynamic> data = res["data"];
      return data;
    } else {
      // 失败
      return Map<String, dynamic>();
    }
  }

  /// form
  static void form(String url) {}

  static void _parseJSON(
      String jsonData, Function successCallback, Function failureCallback) {
    var map = json.decode(jsonData);
    var response = map["response"];
    var status = response["status"];

    int code = status['code'];
    if (code == 100) {
      // 成功
      Map<String, dynamic> data = response["data"];
      successCallback(data);
    } else {
      // 失败
      failureCallback("");
    }
  }
}
