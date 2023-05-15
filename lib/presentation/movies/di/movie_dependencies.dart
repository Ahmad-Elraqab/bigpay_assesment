import 'package:bigpay_assessment/data/repositories/movie_repository_impl.dart';
import 'package:bigpay_assessment/domain/respositories/movie_respository.dart';
import 'package:bigpay_assessment/domain/usecases/movie_usecases.dart';
import 'package:bigpay_assessment/presentation/movies/view_models/movie_view_model.dart';
import 'package:bigpay_assessment/presentation/movies/view_models/movie_widget_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MovieDependencies {
  MovieDependencies._(this.context);

  factory MovieDependencies.of(BuildContext context) {
    return _instance != null
        ? _instance!
        : _instance = MovieDependencies._(context);
  }

  static MovieDependencies? _instance;

  final BuildContext context;

  late List<SingleChildWidget> providers = [
    ..._repositories,
    ..._usecases,
    ..._viewmodels,
  ];

  late final List<Provider> _repositories = [
    Provider<MovieRepository>(
      create: (context) => MovieRepositoryImpl(restService: context.read()),
    ),
  ];

  late final List<Provider> _usecases = [
    Provider<GetMoviesUseCase>(
      create: (context) => GetMoviesUseCase(repository: context.read()),
    ),
  ];

  late final List<ChangeNotifierProvider> _viewmodels = [
    ChangeNotifierProvider<MovieWidgetViewModel>(
      create: (context) => MovieWidgetViewModel(),
    ),
    ChangeNotifierProvider<MovieViewModel>(
      create: (context) => MovieViewModel(
        getMoviesUseCase: context.read(),
        movieWidgetViewModel: context.read(),
      )..getMovieCollection(page: 1),
    ),
  ];
}
