import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/search/domain/entities/result_search.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';
import 'package:github_search/modules/search/domain/repositories/search_repository.dart';
import 'package:github_search/modules/search/domain/use_cases/search_by_text/search_by_text_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

void main() {
  final searchRepository = MockSearchRepository();
  final searchByTextImpl = SearchByTextImpl(
    searchRepository: searchRepository,
  );

  test('deve retornar uma lista de ResultSearch', () async {
    when(() => searchRepository.search('senhordim')).thenAnswer(
      (_) async => const Right(<ResultSearch>[]),
    );
    final result = await searchByTextImpl('senhordim');
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('deve retornar uma exceção caso  texto seja inválido', () async {
    when(() => searchRepository.search('senhordim')).thenAnswer(
      (_) async => const Right(<ResultSearch>[]),
    );
    final result = await searchByTextImpl('');
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
