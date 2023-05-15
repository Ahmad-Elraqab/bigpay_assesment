// For every changes made in router, run the below command:
// `flutter pub run build_runner build --delete-conflicting-outputs`

import 'package:auto_route/annotations.dart';
import 'package:bigpay_assessment/presentation/movies/movies_view.dart';
import 'package:bigpay_assessment/presentation/movies/movies_wrapper.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute(
      path: '/movies',
      initial: true,
      name: 'MoviesRouter',
      page: MoviesWrapper,
      children: [
        MaterialRoute(
          path: '',
          page: MoviesView,
        ),
      ],
    ),
  ],
)
class $Router {}
