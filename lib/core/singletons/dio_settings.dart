import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

String baseUrl = "https://cat-fact.herokuapp.com";

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 35000),
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  final BaseOptions _dioBaseOptionsForAuth = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptionsForAuth({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 35000),
      headers: <String, dynamic>{
        'Accept-Language': lang,
      },
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  BaseOptions get dioBaseOptionsForAuth => _dioBaseOptionsForAuth;


  Dio get dio => Dio(_dioBaseOptions)
    ..interceptors.add(PrettyDioLogger(
      requestBody: kDebugMode,
      request: kDebugMode,
      requestHeader: kDebugMode,
      responseBody: kDebugMode,
      responseHeader: kDebugMode,
      error: kDebugMode,
    ));

  Dio get dioForAuth => Dio(_dioBaseOptionsForAuth)
    ..interceptors.add(LogInterceptor(
      requestBody: kDebugMode,
      request: kDebugMode,
      requestHeader: kDebugMode,
      responseBody: kDebugMode,
      responseHeader: kDebugMode,
      error: kDebugMode,
    ));
}
