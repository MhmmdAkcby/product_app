import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/product_market/cubit/product_cubit.dart';
import 'package:product_app/product_market/product/navigator/navigator_service.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/product/service/project_service.dart';
import 'package:product_app/product_market/service/product_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  await setUp();
  runApp(MyApp());
}

Future<void> setUp() async {
  await navigatorService();
}

Future<void> navigatorService() async {
  GetIt.instance.registerLazySingleton(() => NavigationService());
}

class MyApp extends StatelessWidget with ProjectServiceMixin {
  final GetIt _getIt = GetIt.instance;
  late final NavigationService _navigationService;

  MyApp({super.key}) {
    _navigationService = _getIt<NavigationService>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(ProductService(service)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product App',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('tr'),
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ProjectColor.flushOrange()),
          useMaterial3: true,
          scaffoldBackgroundColor: ProjectColor.superSilver(),
          appBarTheme: AppBarTheme(
            backgroundColor: ProjectColor.superSilver(),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        ),
        initialRoute: "/main",
        routes: _navigationService.routes,
        navigatorKey: _navigationService.navigatorKey,
      ),
    );
  }
}
