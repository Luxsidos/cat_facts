import 'package:task_cat/core/singletons/dio_settings.dart';
import 'package:task_cat/core/singletons/service_locator.dart';
import 'package:task_cat/core/usecases/usecase.dart';
import 'package:task_cat/features/common/repo/handler.dart';
import 'package:task_cat/features/home/data/model/fact_model.dart';
import 'package:task_cat/features/home/domain/entity/fact_entity.dart';

abstract class HomeDatasource {
  Future<List<FactEntity>> getFacts(NoParams param);
  Future<FactEntity> getFact(NoParams param);
}

interface class HomeDatasourceImpl implements HomeDatasource {
  final dio = serviceLocator<DioSettings>().dio;
  final handle = Handler();

  @override
  Future<List<FactEntity>> getFacts(NoParams param) async {
    return handle.apiCantrol(
      request: () {
        return dio.get<List>("/facts");
      },
      body: (response) => response.map((value) => FactModel.fromJson(value)).toList(),
    );
  }

  @override
  Future<FactEntity> getFact(NoParams param) async {
    return handle.apiCantrol(
        request: () {
          return dio.get("/facts/random");
        },
        body: (response) => FactModel.fromJson(response));
  }
}
