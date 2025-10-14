import 'package:ahmed_mossad_flutter_task/config/routes/routes.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        title: 'Task Flutter',
        routerConfig: appRouter,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
