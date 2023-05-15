import 'package:bigpay_assessment/domain/entities/movie_entity.dart';
import 'package:equatable/equatable.dart';

class MovieCollectionEntity extends Equatable {
  final int? page;
  final List<MovieEntity>? movies;
  final int? totalPages;
  final int? totalResults;

  const MovieCollectionEntity({
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });

  MovieCollectionEntity copy({
    int? page,
    List<MovieEntity>? movies,
    int? totalPages,
    int? totalResults,
  }) =>
      MovieCollectionEntity(
        movies: movies ?? this.movies,
        page: page ?? this.page,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  @override
  List<Object?> get props => [
        page,
        movies,
        totalPages,
        totalResults,
      ];
}
