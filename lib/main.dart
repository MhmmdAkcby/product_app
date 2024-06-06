import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product/cubit/product_cubit.dart';
import 'package:product_app/product/product/constant/color/project_color.dart';
import 'package:product_app/product/product/service/project_service.dart';
import 'package:product_app/product/service/product_service.dart';
import 'package:product_app/product/view/main_view/main%20scheme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with ProjectServiceMixin {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(ProductService(service)),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
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
        home: const MainScheme(),
      ),
    );
  }
}
