import 'package:ahmed_mossad_flutter_task/config/routes/routes.dart';
import 'package:ahmed_mossad_flutter_task/config/theme/theme.dart';
import 'package:ahmed_mossad_flutter_task/features/home/data/repository/product_repository_impl.dart';
import 'package:ahmed_mossad_flutter_task/features/home/presentation/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  final ProductRepositoryImpl repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<ProductsCubit>(
            create: (context) => ProductsCubit(repository)..loadAllData(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          supportedLocales: const [Locale('ar')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          title: 'Task Flutter',
          routerConfig: appRouter,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
        ),
      ),
    );
  }
}
