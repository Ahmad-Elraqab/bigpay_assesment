import 'package:bigpay_assessment/domain/repositories/movie_repository.dart';

class GetMoviesUseCase {
  final MovieRepository repository;

  GetMoviesUseCase({required this.repository});

  Future execute({int? page}) async {
    return await repository.getMovies(page: page);
  }
}
