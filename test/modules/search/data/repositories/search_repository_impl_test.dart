import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/search/data/data_source/search_data_source.dart';
import 'package:github_search/modules/search/data/models/result_search_model.dart';
import 'package:github_search/modules/search/data/repositories/search_repository_impl.dart';
import 'package:github_search/modules/search/domain/entities/result_search.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchDataSource extends Mock implements SearchDataSource {}

void main() {
  final dataSource = MockSearchDataSource();
  final repository = SearchRepositoryImpl(
    dataSource: dataSource,
  );

  test(
    'Deve retornar uma lista de ResultSearch',
    () async {
      when(() => dataSource.getSearch('senhordim'))
          .thenAnswer((_) async => <ResultSearchModel>[]);
      final result = await repository.search('senhordim');
      expect(result | null, isA<List<ResultSearch>>());
    },
  );

  test(
    'Deve retornar um erro se o Data source falhar',
    () async {
      when(() => dataSource.getSearch('')).thenThrow(Exception('Source Error'));
      final result = await repository.search('senhordim');
      expect(result.fold(id, id), isA<DataSourceError>());
    },
  );
}
