import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:travel/src/models/request_model.dart';
import 'package:travel/src/models/response_model.dart';

class GenericRepository extends SimpleProvider {
  GenericRepository._internal();

  static GenericRepository get instance => _instance;

  static GenericRepository _instance = GenericRepository._internal();

  @override
  Future<ResponseModel?> sendRequest(RequestModel req) {
    return super.sendRequest(req);
  }
}

class SimpleProvider {
  final _client = new Dio(new BaseOptions(
    baseUrl: 'https://sandbox.musement.com/api/v3/',
    connectTimeout: 10000,
    receiveTimeout: 10000,
    contentType: 'application/json',
  ));

  Function getMethodCall(HTTPMethod method) {
    switch (method) {
      case HTTPMethod.POST:
        return this._client.post;
      case HTTPMethod.GET:
        return this._client.get;
      case HTTPMethod.DELETE:
        return this._client.delete;
      case HTTPMethod.PATCH:
        return this._client.patch;
      case HTTPMethod.PUT:
        return this._client.put;
      default:
        return this._client.get;
    }
  }

  Future<ResponseModel?> get(String path,
      {Map<String, String>? headers, Map<String, dynamic>? queryParams}) {
    return sendRequest(
      new RequestModel(
        path: path,
        headers: headers,
        method: HTTPMethod.GET,
        queryParams: queryParams,
      ),
    );
  }

  Future<ResponseModel?> post(String path,
      {dynamic body,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParams}) {
    return sendRequest(
      new RequestModel(
        body: body,
        path: path,
        headers: headers,
        method: HTTPMethod.POST,
        queryParams: queryParams,
      ),
    );
  }

  Future<ResponseModel?> delete(String path,
      {Map<String, String>? headers, Map<String, dynamic>? queryParams}) {
    return sendRequest(
      new RequestModel(
        path: path,
        headers: headers,
        queryParams: queryParams,
        method: HTTPMethod.DELETE,
      ),
    );
  }

  Future<ResponseModel?> patch(String path,
      {dynamic body,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParams}) {
    return sendRequest(
      new RequestModel(
        body: body,
        path: path,
        headers: headers,
        method: HTTPMethod.PATCH,
        queryParams: queryParams,
      ),
    );
  }

  Future<ResponseModel?> put(String path,
      {dynamic body,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParams}) {
    return sendRequest(
      new RequestModel(
        body: body,
        path: path,
        headers: headers,
        method: HTTPMethod.PUT,
        queryParams: queryParams,
      ),
    );
  }

  Future<ResponseModel?> sendRequest(RequestModel req) async {
    try {
      await InternetAddress.lookup('google.com');
      Map<String, String> headers = {};
      if (req.headers != null) headers.addAll(req.headers!);
      Function methodClient = getMethodCall(req.method);
      Response? res;
      if (req.body != null)
        res = await methodClient(
          req.path,
          data: req.body,
          queryParameters: req.queryParams,
          options: new Options(headers: headers),
        );
      else
        res = await methodClient(
          req.path,
          queryParameters: req.queryParams,
          options: new Options(headers: headers),
        );
      return ResponseModel(
        message: res!.statusMessage,
        statusCode: res.statusCode,
        success: (res.statusCode! >= 200 && res.statusCode! <= 299),
        data: res.data is String &&
                res.data.toString().contains('{') &&
                res.data.toString().contains('}')
            ? json.decode(res.data)
            : res.data,
      );
    } on DioError catch (e) {
      return ResponseModel(
        data: null,
        success: false,
        statusCode: e.response!.statusCode,
        message: e.response!.data != null && e.response!.data is Map
            ? e.response!.data['errors'].join(', ')
            : (e.response!.data is String ? e.response!.data : e.message),
      );
    } on SocketException catch (_) {
      return new ResponseModel(
          data: null,
          message: 'Revisa tu conexión de internet',
          success: false,
          statusCode: 404);
    } catch (e) {
      return null;
    }
  }
}
