import 'package:dartz/dartz.dart';
import 'package:test_today/core/failure.dart';
import 'package:test_today/data/model/post_response_model.dart';

abstract class AppRepository {
  Future<Either<Failure, PostResponseModel>> postData({
    required String token,
    required String id,
    required Map<String, dynamic> data,
    required String postUrlPath,
  });

  Future<Either<Failure, PostResponseModel>> getRandomData({
    required String token,
    String? id,
    required String getURLPath,
  });
}
