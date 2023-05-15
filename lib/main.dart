import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/app/app.dart';
import 'package:marvel_app/data/local/local_data/movie_series_local_storage/marvel_local_storage.dart';
import 'package:marvel_app/shared/cubits/bloc_observer.dart';
import 'app/di/service_locator.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  await setupAppService();
  setupLocalStorage();
  await getIt<MarvelLocalStorage>().initHiveBox();

  runApp(Phoenix(child: const MarvelApp()));
}
