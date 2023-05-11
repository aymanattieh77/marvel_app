import 'package:flutter/material.dart';

import 'package:marvel_app/app/app.dart';

import 'app/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupAppService();

  runApp(const MarvelApp());
}
