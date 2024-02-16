import 'package:dio/dio.dart';
import 'package:task_cat/core/exceptions/exceptions.dart';
import 'package:task_cat/core/exceptions/failures.dart';
import 'package:task_cat/core/usecases/usecase.dart';
import 'package:task_cat/core/utils/either.dart';
import 'package:task_cat/features/common/controllers/base_controller.dart';
import 'package:task_cat/features/home/data/datasource/home_datasource.dart';
import 'package:task_cat/features/home/domain/entity/fact_entity.dart';
import 'package:task_cat/features/home/domain/repo/home_repo.dart';

interface class HomeRepoImpl implements HomeRepo {
  final HomeDatasource dataSource;

  HomeRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<FactEntity>>> getFacts(NoParams param) async {
    final hasInternet = await isInternetConnected();
    if (!hasInternet) {
      return Left(NetworkFailure(errorMessage: 'Please check your network!'));
    }

    try {
      final result = await dataSource.getFacts(param);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.errorMessage,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, FactEntity>> getFact(NoParams param) async {
    final hasInternet = await isInternetConnected();
    if (!hasInternet) {
      return Left(NetworkFailure(errorMessage: 'Please check your network!'));
    }

    try {
      final result = await dataSource.getFact(param);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.errorMessage,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}
