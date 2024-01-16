import 'package:dartz/dartz.dart';

import '../../entities/result_search.dart';
import '../../errors/errors.dart';

abstract class SearchByTextUseCase {
  Future<Either<FailureSearch, List<ResultSearch>?>> call(String searchText);
}
