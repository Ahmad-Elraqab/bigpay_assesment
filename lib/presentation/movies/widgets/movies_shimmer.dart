import 'package:bigpay_assessment/presentation/movies/widgets/movie_shimmer_box.dart';
import 'package:flutter/material.dart';

class MoviesShimmer extends StatefulWidget {
  const MoviesShimmer({super.key});

  @override
  State<MoviesShimmer> createState() => _MoviesShimmerState();
}

class _MoviesShimmerState extends State<MoviesShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 200,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return const MovieShimmerBox();
        },
      ),
    );
  }
}
