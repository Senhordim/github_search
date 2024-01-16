import 'package:dartz/dartz.dart';

import '../../entities/result_search.dart';
import '../../errors/errors.dart';
import '../../repositories/search_repository.dart';
import 'search_by_text_use_case.dart';

class SearchByTextImpl implements SearchByTextUseCase {
  final SearchRepository searchRepository;

  SearchByTextImpl({required this.searchRepository});

  @override
  Future<Either<FailureSearch, List<ResultSearch>?>> call(
      String? searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError());
    }

    return await searchRepository.search(searchText);
  }
}
