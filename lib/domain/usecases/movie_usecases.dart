import 'package:bigpay_assessment/domain/respositories/movie_respository.dart';

class GetMoviesUseCase {
  final MovieRepository repository;

  GetMoviesUseCase({required this.repository});

  Future execute({int? page}) async {
    return await repository.getMovies(page: page);
  }
}
