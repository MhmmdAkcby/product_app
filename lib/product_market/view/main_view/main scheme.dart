import 'package:flutter/material.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/view/draw_user/user_view.dart';
import 'package:product_app/product_market/view/cart/cart_view.dart';
import 'package:product_app/product_market/view/home/home_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:product_app/product_market/view/search/search_view.dart';

part 'main_scheme.g.dart';
part 'appbar_part.g.dart';

class MainScheme extends StatefulWidget {
  const MainScheme({super.key});

  @override
  State<MainScheme> createState() => _MainSchemeState();
}

class _MainSchemeState extends GenericMainScheme<MainScheme> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabbarName.values.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const UserView(),
        bottomNavigationBar: BottomAppBarWidget(widget: _tabbarMethod()),
        appBar: const _PartAppBar(),
        body: _tabbarView(),
      ),
    );
  }

  TabBarView _tabbarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [HomeView(), SearchView(), CartView(), Placeholder()],
    );
  }

  TabBar _tabbarMethod() {
    var d = AppLocalizations.of(context);
    return TabBar(
      labelColor: ProjectColor.flushOrange(),
      padding: EdgeInsets.zero,
      indicator: const BoxDecoration(),
      unselectedLabelColor: ProjectColor.mortarGrey(),
      controller: _tabController,
      tabs: _MyTabbarName.values
          .map((e) => Tab(
                text: e.getLocalizedName(d!).toUpperCase(),
                icon: Icon(e.icons()),
              ))
          .toList(),
    );
  }
}

class _WidgetSize {
  final double fabElevation = 20;
  final double _notchMargin = 5;
  final double appBarText = 25;
  final double welcomeTextSize = 13;
  final double tabElevation = 20;
  final double circularAvatarRadius = 24.0;
  final double borderRadius = 10;
  final double bottomAppbarHeight = 0.065;
}

class _AppBarPadding extends EdgeInsets {
  const _AppBarPadding.all() : super.all(8.0);
}

abstract class GenericMainScheme<T extends MainScheme> extends State<T> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabbarName.values.length, vsync: this);
  }
}
