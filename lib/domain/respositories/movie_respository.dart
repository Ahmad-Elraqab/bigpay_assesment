import 'package:bigpay_assessment/domain/entities/movie_collection_entity.dart';

abstract class MovieRepository {
  Future<MovieCollectionEntity> getMovies({int? page});
}
