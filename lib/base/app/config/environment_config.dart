// Copyright (c) 2021, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

enum EnvironmentType { dev, staging, prod }

/// Environment configuration that enables you to get define and reuse
/// environment specific properties (such as API endpoints, server secrets, ...)
class EnvironmentConfig {
  const EnvironmentConfig._({
    required this.apiKey,
    required this.baseApiUrl,
    required this.websocketUrl,
    this.environment = EnvironmentType.dev,
  });

  final EnvironmentType environment;
  final String baseApiUrl;
  final String apiKey;
  final String websocketUrl;

  /// region Environments
  ///
  /// Don't forget to change vapid key in app_constants for web production

  static const EnvironmentConfig dev = EnvironmentConfig._(
      apiKey: '4ff694fd12dd0a54157cdcfd8f29a4fb',
      environment: EnvironmentType.dev,
      baseApiUrl: 'https://api.themoviedb.org/3/',
      websocketUrl: 'wss://');

  static const EnvironmentConfig staging = EnvironmentConfig._(
    apiKey: '4ff694fd12dd0a54157cdcfd8f29a4fb',
    environment: EnvironmentType.staging,
    baseApiUrl: 'https://api.themoviedb.org/3/',
    websocketUrl: 'wss://',
  );

  /// Don't forget to change vapid key in app_constants for web production
  static const EnvironmentConfig prod = EnvironmentConfig._(
    apiKey: '4ff694fd12dd0a54157cdcfd8f29a4fb',
    environment: EnvironmentType.prod,
    baseApiUrl: 'https://api.themoviedb.org/3/',
    websocketUrl: 'wss://',
  );
}
