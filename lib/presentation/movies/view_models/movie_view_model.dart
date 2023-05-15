import 'package:bigpay_assessment/base/interceptors/custom_dio_errors.dart';
import 'package:bigpay_assessment/domain/entities/movie_collection_entity.dart';
import 'package:bigpay_assessment/domain/usecases/movie_usecases.dart';
import 'package:bigpay_assessment/presentation/movies/view_models/movie_widget_view_model.dart';
import 'package:flutter/material.dart';

class MovieViewModel extends ChangeNotifier {
  MovieViewModel({
    required this.getMoviesUseCase,
    required this.movieWidgetViewModel,
  });

  final MovieWidgetViewModel movieWidgetViewModel;
  final GetMoviesUseCase getMoviesUseCase;

  MovieCollectionEntity? collection;

  Future<void> getMovieCollection({int? page}) async {
    try {
      // movieWidgetViewModel.isLoading = true;

      collection = await getMoviesUseCase.execute(page: page);

      movieWidgetViewModel.isLoading = false;
    } catch (e) {
      movieWidgetViewModel.isError = true;
      movieWidgetViewModel.errorMsg = (e as RestException).responseMessage;
      movieWidgetViewModel.isLoading = false;
    }
  }

  Future<void> getMoreMovies() async {
    try {
      final data =
          await getMoviesUseCase.execute(page: (collection!.page! + 1));

      collection = collection!.copy(
        movies: [...collection?.movies ?? [], ...data.movies],
        page: data.page,
        totalPages: data.totalPages,
        totalResults: data.totalResults,
      );
      notifyListeners();
    } catch (e) {
      movieWidgetViewModel.errorMsg = (e as RestException).responseMessage;
      movieWidgetViewModel.isError = true;
    }
  }

  Future<void> refreshMovieCollection() async {
    try {
      movieWidgetViewModel.isError = false;
      movieWidgetViewModel.isLoading = true;

      collection = await getMoviesUseCase.execute(page: 1);

      movieWidgetViewModel.isLoading = false;
    } catch (e) {
      movieWidgetViewModel.errorMsg = (e as RestException).responseMessage;
      movieWidgetViewModel.isError = true;
      movieWidgetViewModel.isLoading = false;
    }
  }
}
