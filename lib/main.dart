import 'package:flutter/material.dart';
import 'package:marvel_app/app/app.dart';
import 'package:marvel_app/data/api_services/movies_series/movies_series_service.dart';
import 'package:marvel_app/data/network/dio_factory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MarvelApp());
}
