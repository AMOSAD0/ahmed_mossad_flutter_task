import 'package:ahmed_mossad_flutter_task/app/app.dart';
import 'package:ahmed_mossad_flutter_task/di/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}
