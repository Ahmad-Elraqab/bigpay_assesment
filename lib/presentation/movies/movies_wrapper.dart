import 'package:auto_route/auto_route.dart';
import 'package:bigpay_assessment/presentation/movies/di/movie_dependencies.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MoviesWrapper extends StatefulWidget {
  const MoviesWrapper({Key? key}) : super(key: key);

  @override
  State<MoviesWrapper> createState() => _MoviesWrapperState();
}

class _MoviesWrapperState extends State<MoviesWrapper> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MovieDependencies.of(context).providers,
      builder: (context, child) => _init(context),
    );
  }

  AutoRouter _init(BuildContext context) {
    return const AutoRouter();
  }
}
