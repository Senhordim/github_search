import 'package:dartz/dartz.dart';

import '../../domain/entities/result_search.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/search_repository.dart';
import '../data_source/search_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImpl({required this.dataSource});

  @override
  Future<Either<FailureSearch, List<ResultSearch>?>> search(
      String searchText) async {
    try {
      final result = await dataSource.getSearch(searchText);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError(message: e.toString()));
    }
  }
}
