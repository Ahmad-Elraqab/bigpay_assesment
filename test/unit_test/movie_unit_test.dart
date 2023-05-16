import 'package:bigpay_assessment/data/repositories/movie_repository_impl.dart';
import 'package:bigpay_assessment/data/repositories/rest_repository.dart';
import 'package:bigpay_assessment/domain/entities/movie_collection_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

class MockMovieRepository extends MovieRepositoryImpl {
  MockMovieRepository({required super.restService});

  @override
  Future<MovieCollectionEntity> getMovies({int? page}) async {
    // ignore: avoid_print
    print('Fetching From Mock Repository');
    return super.getMovies(page: page);
  }
}

void main() {
  RestService restService = RestService(
    baseUrl: 'https://api.themoviedb.org/3/',
    apiKey: '4ff694fd12dd0a54157cdcfd8f29a4fb',
  );
  final obj = MockMovieRepository(restService: restService);

  test('test fetching inital movie list', () async {
    final data = await obj.getMovies(page: 1);

    await expectLater(data, isNotNull);
    await expectLater(data.movies?.isNotEmpty, true);
  });

  test('test fetching invalid page number', () async {
    await expectLater(
      restService.dio
          .get('/movie/popular?api_key=${restService.apiKey}&page=600'),
      throwsA(
        isA<DioError>()
            .having((error) => error.response?.statusCode, 'statusCode', 422),
      ),
    );
  });
}
