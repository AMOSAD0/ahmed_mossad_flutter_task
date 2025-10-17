import 'package:ahmed_mossad_flutter_task/app/app.dart';
import 'package:ahmed_mossad_flutter_task/di/injection.dart';
import 'package:ahmed_mossad_flutter_task/features/home/data/data_sources/product_local_data_source.dart';
import 'package:ahmed_mossad_flutter_task/features/home/data/repository/product_repository_impl.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final repo = ProductRepositoryImpl(ProductLocalDataSource.instance);

  runApp(MyApp(repository: repo));
}
