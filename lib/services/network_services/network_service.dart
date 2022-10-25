// ignore_for_file: always_declare_return_types

import 'package:dio/dio.dart';

class NetworkService {
  static Dio? _api;
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  NetworkService() {
    _api ??= Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        sendTimeout: 10000,
      ),
    );
  }

  _setHeader() {
    _api!.options.headers.clear();
    _api!.options.headers['content-type'] = 'application/json; charset=utf-8';
    _api!.options.headers['Connection'] = 'keep-alive';
  }

  Future<Response<dynamic>> get(String path) async {
    _setHeader();
    return await _api!.get(path);
  }
}
