import 'package:bigpay_assessment/presentation/movies/view_models/movie_view_model.dart';
import 'package:bigpay_assessment/presentation/movies/view_models/movie_widget_view_model.dart';
import 'package:bigpay_assessment/presentation/movies/widgets/movie_shimmer_box.dart';
import 'package:bigpay_assessment/presentation/movies/widgets/movies_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Center(
          child: Text(
            'Popular Movies',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Consumer2<MovieWidgetViewModel, MovieViewModel>(
        builder: (context, value, value2, child) => RefreshIndicator(
          key: const Key('movies_refresh_indicator'),
          onRefresh: () => value2.refreshMovieCollection(),
          child: value.isLoading
              ? const MoviesShimmer()
              : value.isError
                  ? Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: ListView(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.3),
                                const Icon(
                                  Icons.error,
                                  size: 50.0,
                                ),
                                const SizedBox(height: 20.0),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 55.0),
                                    child: Text(
                                      value.errorMsg,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(6.0),
                            color: Colors.white,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisExtent: 200,
                              ),
                              itemCount:
                                  ((value2.collection?.movies?.length ?? 0) +
                                      5),
                              itemBuilder: (context, index) {
                                if (index < value2.collection!.movies!.length) {
                                  final item =
                                      value2.collection!.movies![index];
                                  return SizedBox(
                                    key: Key(item.title.toString()),
                                    child: Container(
                                      key: const Key('movie_poster'),
                                      margin: const EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            item.posterPath.toString(),
                                          ),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 5),
                                            blurRadius: 5,
                                            color: Colors.grey.shade200,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                } else {
                                  if (value2.collection!.page! < 500) {
                                    value2.getMoreMovies();
                                    return const MovieShimmerBox();
                                  }
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
