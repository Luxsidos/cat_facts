import 'package:task_cat/core/exceptions/failures.dart';
import 'package:task_cat/core/usecases/usecase.dart';
import 'package:task_cat/core/utils/either.dart';
import 'package:task_cat/features/home/domain/entity/fact_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<FactEntity>>> getFacts(NoParams param);
  Future<Either<Failure, FactEntity>> getFact(NoParams param);
}
