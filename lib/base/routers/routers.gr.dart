// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../presentation/movies/movies_view.dart' as _i2;
import '../../presentation/movies/movies_wrapper.dart' as _i1;

class Router extends _i3.RootStackRouter {
  Router([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MoviesRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MoviesWrapper(),
      );
    },
    MoviesView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MoviesView(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/movies',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          MoviesRouter.name,
          path: '/movies',
          children: [
            _i3.RouteConfig(
              MoviesView.name,
              path: '',
              parent: MoviesRouter.name,
            )
          ],
        ),
      ];
}

/// generated route for
/// [_i1.MoviesWrapper]
class MoviesRouter extends _i3.PageRouteInfo<void> {
  const MoviesRouter({List<_i3.PageRouteInfo>? children})
      : super(
          MoviesRouter.name,
          path: '/movies',
          initialChildren: children,
        );

  static const String name = 'MoviesRouter';
}

/// generated route for
/// [_i2.MoviesView]
class MoviesView extends _i3.PageRouteInfo<void> {
  const MoviesView()
      : super(
          MoviesView.name,
          path: '',
        );

  static const String name = 'MoviesView';
}
