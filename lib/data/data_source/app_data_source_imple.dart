import 'dart:convert';

import 'package:test_today/services/app_storage_service.dart';
import 'package:test_today/services/http_services.dart';

import 'app_data_source.dart';

class AppDataSourceImple extends AppDataSource {
  final ApiProvider apiProvider;
  final AppStorageService appStorageService;

  AppDataSourceImple({
    required this.apiProvider,
    required this.appStorageService,
  });

  @override
  Future postData({
    required String token,
    required String id,
    required Map<String, dynamic> data,
    required String postUrlPath,
  }) async {
    String basicAuth = 'Basic ${base64.encode(utf8.encode('$id:$token'))}';
    return await apiProvider.post(
      path: postUrlPath,
      data: data,
      authorization: basicAuth,
    );
  }

  @override
  Future getRandomData({
    required String token,
    String? id,
    required String getURLPath,
  }) async {
    String basicAuth = 'Basic ${base64.encode(utf8.encode('$id:$token'))}';
    return await apiProvider.get(
      getURLPath,
      authorization: basicAuth,
    );
  }
}
