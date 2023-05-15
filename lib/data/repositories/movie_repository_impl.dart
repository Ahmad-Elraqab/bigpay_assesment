import 'dart:convert';

import 'package:bigpay_assessment/data/models/movie_collection_model.dart';
import 'package:bigpay_assessment/data/models/movie_model.dart';
import 'package:bigpay_assessment/data/repositories/rest_repository.dart';
import 'package:bigpay_assessment/domain/entities/movie_collection_entity.dart';
import 'package:bigpay_assessment/domain/entities/movie_entity.dart';
import 'package:bigpay_assessment/domain/respositories/movie_respository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl({required this.restService});
  RestService restService;
  @override
  Future<MovieCollectionEntity> getMovies({int? page}) async {
    try {
      final response = await restService.dio.get(
        '/movie/popular?api_key=${restService.apiKey}&page=$page',
      );

      final collection = MovieCollectionModel.formJson(response.data);

      return _mapModelToEntity(collection);
    } catch (e) {
      rethrow;
    }
  }

  MovieCollectionEntity _mapModelToEntity(MovieCollectionModel collection) =>
      MovieCollectionEntity(
        movies: collection.movies
            ?.map(
              (e) => MovieEntity(
                adult: e.adult,
                backdropPath: e.backdropPath,
                genreIds: e.genreIds,
                id: e.id,
                originalLanguage: e.originalLanguage,
                originalTitle: e.originalTitle,
                overview: e.overview,
                popularity: e.popularity,
                posterPath: e.posterPath,
                releaseDate: e.releaseDate,
                title: e.title,
                video: e.video,
                voteAverage: e.voteAverage,
                voteCount: e.voteCount,
              ),
            )
            .toList(),
        page: collection.page,
        totalPages: collection.totalPages,
        totalResults: collection.totalResults,
      );

  MovieCollectionModel _mapEntityToModel(MovieCollectionEntity collection) =>
      MovieCollectionModel(
        movies: collection.movies
            ?.map(
              (e) => MovieModel(
                adult: e.adult,
                backdropPath: e.backdropPath,
                genreIds: e.genreIds,
                id: e.id,
                originalLanguage: e.originalLanguage,
                originalTitle: e.originalTitle,
                overview: e.overview,
                popularity: e.popularity,
                posterPath: e.posterPath,
                releaseDate: e.releaseDate,
                title: e.title,
                video: e.video,
                voteAverage: e.voteAverage,
                voteCount: e.voteCount,
              ),
            )
            .toList(),
        page: collection.page,
        totalPages: collection.totalPages,
        totalResults: collection.totalResults,
      );
}
