import 'package:bigpay_assessment/data/models/movie_model.dart';
import 'package:equatable/equatable.dart';

class MovieCollectionModel extends Equatable {
  final int? page;
  final List<MovieModel>? movies;
  final int? totalPages;
  final int? totalResults;

  const MovieCollectionModel({
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });

  factory MovieCollectionModel.formJson(Map<String, dynamic> json) =>
      MovieCollectionModel(
        page: json['page'],
        movies: (json['results'] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList(),
        totalPages: json['totalPages'],
        totalResults: json['totalResults'],
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': movies?.map((e) => e.toJson()).toList(),
        'totalPages': totalPages,
        'totalResults': totalResults,
      };
  @override
  List<Object?> get props => [
        page,
        movies,
        totalPages,
        totalResults,
      ];
}
