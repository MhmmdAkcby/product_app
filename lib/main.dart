import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product/cubit/product_cubit.dart';
import 'package:product_app/product/product/constant/color/project_color.dart';
import 'package:product_app/product/product/service/project_service.dart';
import 'package:product_app/product/service/product_service.dart';
import 'package:product_app/product/view/main_view/main%20scheme.dart';

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
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ProjectColor.flushOrange()),
          useMaterial3: true,
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
