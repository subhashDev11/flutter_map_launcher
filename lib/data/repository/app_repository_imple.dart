import 'package:dartz/dartz.dart';
import 'package:test_today/core/failure.dart';
import 'package:test_today/data/data_source/app_data_source.dart';
import 'package:test_today/data/model/post_response_model.dart';
import 'package:test_today/services/app_storage_service.dart';
import 'app_repository.dart';

class AppRepositoryImple extends AppRepository {
  final AppStorageService appStorageService;
  final AppDataSource appDataSource;

  AppRepositoryImple({
    required this.appDataSource,
    required this.appStorageService,
  });

  @override
  Future<Either<Failure, PostResponseModel>> postData(
      {required String token,
      required String id,
      required Map<String, dynamic> data,
      required String postUrlPath}) async {
    try {
      final res = await appDataSource.postData(
        token: token,
        id: id,
        postUrlPath: postUrlPath,
        data: data,
      );
      if (res == null) () => Left(resIfNull());
      final postResponseModel = PostResponseModel.fromJson(res);
      if (res['success'] != null && res['success'] == true) {
        return Right(postResponseModel);
      } else {
        return Left(
          onFailure(
            postResponseModel.errors,
            title: postResponseModel.message,
          ),
        );
      }
    } catch (e) {
      return Left(
        onFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, PostResponseModel>> getRandomData({
    required String token,
    String? id,
    required String getURLPath,
  }) async {
    try {
      final res = await appDataSource.getRandomData(
        token: token,
        getURLPath: getURLPath,
      );
      if (res == null) () => Left(resIfNull());
      final postResponseModel = PostResponseModel.fromJson(res);
      if (postResponseModel.success != null && postResponseModel.success == true) {
        return Right(postResponseModel);
      } else {
        return const Left(NotFound());
      }
    } catch (e) {
      return const Left(NotFound());
    }
  }
}
