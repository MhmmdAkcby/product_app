import 'package:flutter/material.dart';
import 'package:product_app/product/product/constant/color/project_color.dart';
import 'package:product_app/product/product/widget/draw_widget/naw_drawer_widget.dart';

part 'home_part.g.dart';
part 'appbar_part.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends GenericHomeView<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabbarName.values.length,
      child: Scaffold(
        drawer: const NawDrawerWidget(),
        bottomNavigationBar: BottomAppBarWidget(widget: _tabbarMethod()),
        appBar: const _PartAppBar(),
        floatingActionButton: const _FabWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _tabbarView(),
      ),
    );
  }

  TabBarView _tabbarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [Container(), const Placeholder(), const Placeholder(), const Placeholder()],
    );
  }

  TabBar _tabbarMethod() {
    return TabBar(
      labelColor: ProjectColor.flushOrange(),
      padding: EdgeInsets.zero,
      indicator: const BoxDecoration(),
      unselectedLabelColor: ProjectColor.mortarGrey(),
      controller: _tabController,
      tabs: _MyTabbarName.values
          .map((e) => Tab(
                text: e.name.toUpperCase(),
                icon: Icon(e.icons()),
              ))
          .toList(),
    );
  }
}

class _WidgetSize {
  final double fabElevation = 20;
  final double _notchMargin = 10;
  final double appBarText = 25;
  final double welcomeTextSize = 13;
}

class _AppBarPaddinng extends EdgeInsets {
  const _AppBarPaddinng.all() : super.all(8.0);
}

abstract class GenericHomeView<T extends HomeView> extends State<T> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabbarName.values.length, vsync: this);
  }
}
