import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_app/app/app.dart';
import 'package:marvel_app/shared/cubits/bloc_observer.dart';

import 'app/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupAppService();

  runApp(const MarvelApp());
}
