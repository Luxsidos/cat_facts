import 'package:task_cat/core/exceptions/failures.dart';
import 'package:task_cat/core/singletons/service_locator.dart';
import 'package:task_cat/core/usecases/usecase.dart';
import 'package:task_cat/core/utils/either.dart';
import 'package:task_cat/features/home/data/repo/home_repo_impl.dart';
import 'package:task_cat/features/home/domain/entity/fact_entity.dart';

class FactsUseCase extends UseCase<List<FactEntity>, NoParams> {
  final HomeRepoImpl repository = serviceLocator<HomeRepoImpl>();

  @override
  Future<Either<Failure, List<FactEntity>>> call(NoParams params) async => await repository.getFacts(params);
}
