import 'package:flutter/material.dart';
import 'package:product_app/product/product/constant/color/project_color.dart';
import 'package:product_app/product/view/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ProjectColor.flushOrange()),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: ProjectColor.superSilver(),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
      home: const HomeView(),
    );
  }
}
