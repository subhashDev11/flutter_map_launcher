import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:test_today/data/model/post_response_model.dart';

import '../core/utils/utils.dart';
import 'base_api.dart';

typedef OnUploadProgressCallback = void Function(int sentBytes, int totalBytes);

class ApiProvider {
  ApiProvider.instance();

  Future<dynamic> getRandom(String url, {String? token}) async {
    dynamic responseJson;
    final header = ({
      'Accept': 'application/json',
    });

    if (token != null) {
      header['Authorization'] = 'Bearer $token';
    }

    try {
      reqLogger(url, 'GET');
      final response = await http.get(
        Uri.parse(url),
        headers: header,
      );
      responseJson = _response(response, url, 'GET');
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> get(String path, {String? authorization}) async {
    dynamic responseJson;
    final header = ({
      'Accept': 'application/json',
    });

    if (authorization != null) {
      header['Authorization'] = authorization;
    }
    try {
      reqLogger(BaseApi.baseUrl + path, 'GET', token: authorization);
      final response = await http.get(
        Uri.parse(BaseApi.baseUrl + path),
        headers: header,
      );
      responseJson = _response(response, BaseApi.baseUrl + path, 'GET');
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response, String uri, String reqType) {
    final cdt = DateTime.now();
    try {
      final cdt = DateTime.now();
      switch (response.statusCode) {
        case 200:
          AppLogger.i('Parsed $uri $reqType at $cdt  \n res -> ${response.body}');
          dynamic responseJson;
          try {
            responseJson = json.decode(response.body.toString());
          } catch (e) {
            responseJson = response.body;
          }
          AppLogger.i('Parsed $uri $reqType at $cdt  \n data res -> $responseJson');
          return responseJson;
        case 400:
          AppLogger.e(
              'Error Code 400 for $uri ${reqType.toUpperCase()} at $cdt  \n error res -> ${response.body.toString()}');
          AppLogger.e('Parsed $uri $reqType at $cdt  \n res -> ${response.body}');
          dynamic responseJson;
          try {
            responseJson = json.decode(response.body.toString());
          } catch (e) {
            responseJson = response.body;
          }
          return responseJson;
        case 401:
          dynamic responseJson;
          try {
            responseJson = json.decode(response.body.toString());
          } catch (e) {
            responseJson = response.body;
          }
          AppLogger.e('Error Code 401 for $uri ${reqType.toUpperCase()} at $cdt with res-> $responseJson');
          return responseJson;
        case 403:
          AppLogger.e(
              'Error Code 403 for $uri ${reqType.toUpperCase()} at $cdt  \n error res -> ${response.body.toString()}');
          dynamic responseJson;
          try {
            responseJson = json.decode(response.body.toString());
          } catch (e) {
            responseJson = response.body;
          }
          return PostResponseModel(
            success: false,
            status: 403,
            message: responseJson['message'] ?? 'Unauthorized access',
            errors: responseJson['error'] ?? '',
          ).toJson();
        case 500:
          AppLogger.e(
              'Error Code 500 for $uri ${reqType.toUpperCase()} at $cdt  \n error res -> ${response.body.toString()}');
          dynamic responseJson;
          try {
            responseJson = json.decode(response.body.toString());
          } catch (e) {
            responseJson = response.body;
          }
          return PostResponseModel(
            success: false,
            status: 500,
            message: responseJson['message'] ?? 'Server error',
            errors: responseJson['error'] ?? 'Internal server error',
          ).toJson();

        default:
          AppLogger.e(
              'Error occurred while Communication with Server with StatusCode : ${response.statusCode} for request ${BaseApi.baseUrl + uri} ${reqType.toUpperCase()} at $cdt  \n error res -> ${response.body.toString()}');
          if (response.body != null) {
            dynamic responseJson;
            try {
              responseJson = json.decode(response.body.toString());
            } catch (e) {
              responseJson = response.body;
            }
            return PostResponseModel(
              success: false,
              status: response.statusCode,
              message: responseJson['message'] ?? 'Error',
              errors: responseJson['error'] ?? '',
            ).toJson();
          } else {
            throw FetchDataException(
                'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
          }
      }
    } catch (e) {
      AppLogger.e('Exception for request- $uri ${reqType.toUpperCase()} at $cdt  \n with exception -> ${e.toString()}');
      return PostResponseModel(
        success: false,
        status: response.statusCode,
        message: 'Bad access exception',
      ).toJson();
    }
  }

  Future<dynamic> post({required String path, String? authorization, dynamic data}) async {
    dynamic responseJson;

    final header = ({
      //'Accept': 'application/json',
      'Content-Type': 'application/json',
    });

    if (authorization != null) {
      header['Authorization'] = authorization;
    }
    try {
      reqLogger(
        '${BaseApi.baseUrl}$path, data -> $data',
        'POST',
        token: authorization,
      );
      final pdata = json.encode(data);
      log('log data -> $pdata ');
      final response = await http.post(
        Uri.parse(
          BaseApi.baseUrl + path,
        ),
        body: pdata,
        headers: header,
      );
      //final res = http.Request('POST', Uri.parse(BaseApi.baseUrl + path));
      //res.body = jsonEncode(data).toString();
      //res.headers.addAll(header);
      //var streamResponse = await res.send();
      //final response = await http.Response.fromStream(streamResponse);
      responseJson = _response(
        response,
        BaseApi.baseUrl + path,
        'POST',
      );
    } catch (e) {
      AppLogger.e('Failed to Post Data at -> ${BaseApi.baseUrl + path} $e');
      throw FetchDataException('Failed to Post Data at -> ${BaseApi.baseUrl + path} $e');
    }
    return responseJson;
  }

  Future<dynamic> uploadFile(
      {required String path,
      String? token,
      required String filePath,
      String? previousValue,
      OnUploadProgressCallback? onUploadProgressCallback}) async {
    dynamic responseJson;
    final header = ({
      //'Accept': 'application/json',
      'Content-Type': 'application/json',
    });

    if (token != null) {
      header['Authorization'] = 'Bearer $token';
    }
    try {
      reqLogger(
        '${BaseApi.baseUrl}$path, file -> $filePath',
        'POST FILE',
      );
      var uploadURI = Uri.parse(BaseApi.baseUrl + path);
      // http.MultipartRequest request = http.MultipartRequest("POST", uploadURI);
      // request.headers.addAll(header);
      // http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      //   'uploaded_file',
      //   filePath,
      // );
      // request.files.add(multipartFile);
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST', uploadURI);
      request.fields.addAll({
        'previous_value': '$previousValue',
      });
      request.files.add(await http.MultipartFile.fromPath(
        'uploaded_file',
        filePath,
      ));

      request.headers.addAll(headers);

      http.StreamedResponse streamResponse = await request.send();

      final response = await http.Response.fromStream(streamResponse);
      responseJson = _response(response, BaseApi.baseUrl + path, 'POST File');
    } catch (e) {
      AppLogger.e('Failed to Post File at -> ${BaseApi.baseUrl + path} $e');
      throw FetchDataException('Failed to Post File at -> ${BaseApi.baseUrl + path} $e');
    }
    return responseJson;
  }

  Future<dynamic> uploadFileWithRecord({
    required String urlPath,
    required String token,
    required String id,
    required String column,
    required String uploadFor,
    required String filePath,
    String? previousValue,
  }) async {
    dynamic responseJson;
    final header = ({
      //'Accept': 'application/json',
      'Content-Type': 'application/json',
    });

    header['Authorization'] = 'Bearer $token';
    try {
      final uploadData = {
        'previous_value': '$previousValue',
        'id': id,
        'upload_for': uploadFor,
        'column': column,
      };

      reqLogger(
        '${BaseApi.baseUrl}$urlPath, file -> $filePath, DATA -> $uploadData',
        'POST FILE',
      );
      var uploadURI = Uri.parse(BaseApi.baseUrl + urlPath);
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST', uploadURI);
      request.fields.addAll(uploadData);
      request.files.add(await http.MultipartFile.fromPath(
        'uploaded_file',
        filePath,
      ));

      request.headers.addAll(headers);

      http.StreamedResponse streamResponse = await request.send();

      final response = await http.Response.fromStream(streamResponse);
      responseJson = _response(response, BaseApi.baseUrl + urlPath, 'POST File');
    } catch (e) {
      AppLogger.e('Failed to Post File at -> ${BaseApi.baseUrl + urlPath} $e');
      throw FetchDataException('Failed to Post File at -> ${BaseApi.baseUrl + urlPath} $e');
    }
    return responseJson;
  }

  void reqLogger(String uri, String reqType, {String? data, String? token}) {
    final cdt = DateTime.now();
    AppLogger.i(
        'New ${reqType.toUpperCase()} for $uri at $cdt ${data != null ? 'with req body -> $data' : 'with token -> $token'} ');
  }
}

class CustomException implements Exception {
  final String message;
  final String? prefix;

  CustomException({required this.message, this.prefix});

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException(String message) : super(message: message, prefix: "Error During Communication:");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message: message, prefix: "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message: message, prefix: "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException(String message) : super(message: message, prefix: "Invalid Input: ");
}

class CustomResponse {
  final String message;
  final bool isSuccess;
  final dynamic data;

  CustomResponse({required this.isSuccess, required this.data, required this.message});
}
