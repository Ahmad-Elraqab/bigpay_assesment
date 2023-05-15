import 'package:flutter/material.dart';
import 'base/app/app.dart';
import 'base/app/config/environment_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App(config: EnvironmentConfig.prod));
}
