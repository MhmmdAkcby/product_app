import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/auth/cubit/login_cubit.dart'; // Import LoginCubit
import 'package:product_app/auth/cubit/user_cubit.dart';
import 'package:product_app/auth/service/auth_service.dart';
import 'package:product_app/auth/service/login_service.dart'; // Import LoginService
import 'package:product_app/auth/service/user_service.dart';
import 'package:product_app/product_market/cubit/product_cubit.dart';
import 'package:product_app/product_market/product/utils/navigator/navigator_service.dart';
import 'package:product_app/product_market/product/service/alert_service.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/product/service/project_service.dart';
import 'package:product_app/product_market/service/product_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  runApp(MyApp());
}

Future<void> setUp() async {
  await navigatorService();
}

Future<void> navigatorService() async {
  GetIt.instance.registerLazySingleton(() => NavigationService());
  GetIt.instance.registerLazySingleton(() => AlertService());
}

class MyApp extends StatelessWidget with ProjectServiceMixin {
  final GetIt _getIt = GetIt.instance;
  late final NavigationService _navigationService;

  MyApp({super.key}) {
    _navigationService = _getIt<NavigationService>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkUserLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home:
                  Container(color: ProjectColor.whiteColor(), child: const Center(child: CircularProgressIndicator())));
        }

        final initialRoute = snapshot.data == true ? '/main' : '/login';

        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProductCubit(ProductService(service)),
            ),
            BlocProvider(
              create: (context) => LoginCubit(LoginService(), AuthService()),
            ),
            BlocProvider(
              create: (context) => UserCubit(UserService(service)),
            )
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
            initialRoute: initialRoute,
            routes: _navigationService.routes,
            navigatorKey: _navigationService.navigatorKey,
          ),
        );
      },
    );
  }

  Future<bool> _checkUserLoginStatus() async {
    final authService = AuthService();
    return await authService.isUserLoggedIn();
  }
}
