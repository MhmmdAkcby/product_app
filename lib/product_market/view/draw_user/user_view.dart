import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/auth/cubit/login_cubit.dart';
import 'package:product_app/auth/cubit/user_cubit.dart';
import 'package:product_app/auth/model/user_model.dart';
import 'package:product_app/product_market/product/mixin/categories_mixin.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:product_app/product_market/product/utils/lottie/loading_lottie.dart';
import 'package:product_app/product_market/product/widget/my_button.dart';
import 'package:product_app/product_market/view/draw_user/user_state.dart';

import '../../../auth/cubit/user_cubit_sate.dart';

class UserView extends StatefulWidget with CategoriesMixin {
  const UserView({super.key});

  @override
  State<UserView> createState() => _NawDrawerWidgetState();
}

class _NawDrawerWidgetState extends UserState<UserView> {
  @override
  Widget build(BuildContext context) {
    var d = AppLocalizations.of(context);
    return Drawer(
      backgroundColor: ProjectColor.whiteColor(),
      child: BlocBuilder<UserCubit, UserCubitSate>(
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingLottie();
          }
          if (state.item == null || state.item!.isEmpty) {
            return Center(child: Text(d!.userError));
          }

          final usernameFuture = authService.getUserInfo();

          return FutureBuilder<String?>(
            future: usernameFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingLottie();
              }

              List<Users> filteredProducts = userFilter(snapshot, state);

              if (filteredProducts.isEmpty) {
                return Center(child: Text(d!.userError));
              }

              return ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index >= filteredProducts.length) {
                    return Center(child: Text(d!.listError));
                  }
                  return _buildUI(context: context, filteredProducts: filteredProducts[index]);
                },
              );
            },
          );
        },
      ),
    );
  }

  Column _buildUI({required BuildContext context, required Users filteredProducts}) {
    var d = AppLocalizations.of(context);
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DrawerHeader(
            child: _userProfileView(filteredProducts: filteredProducts),
          ),
        ),
        _userInfo(
            filteredProducts: filteredProducts,
            data: '${d!.name}: ${filteredProducts.firstName}',
            icon: Icons.supervised_user_circle_rounded),
        _userInfo(
            filteredProducts: filteredProducts,
            data: '${d.surname}: ${filteredProducts.lastName}',
            icon: Icons.supervised_user_circle_rounded),
        _userInfo(
            filteredProducts: filteredProducts,
            data: '${d.userName}: ${filteredProducts.username}',
            icon: Icons.data_saver_off_rounded),
        _userInfo(filteredProducts: filteredProducts, data: filteredProducts.email, icon: Icons.mail),
        _logoutButton(context),
      ],
    );
  }

  Card _userInfo({required Users filteredProducts, required String data, required IconData icon}) {
    return Card(
      color: ProjectColor.whiteColor(),
      elevation: _WidgetSize().elevation,
      child: ListTile(
        title: Text(data),
        leading: Icon(icon),
      ),
    );
  }

  Widget _userProfileView({required Users filteredProducts}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * _WidgetSize().userProfileWidth,
      height: MediaQuery.of(context).size.height * _WidgetSize().userProfileHeight,
      child: CircleAvatar(
        backgroundColor: ProjectColor.whiteColor(),
        radius: _WidgetSize().circularAvatarIcon,
        child: ClipOval(child: Image.network(filteredProducts.image, fit: BoxFit.cover)),
      ),
    );
  }

  Widget _logoutButton(BuildContext context) {
    final isLoading = context.watch<LoginCubit>().state.isLoading;
    final d = AppLocalizations.of(context);

    return Container(
      margin: const _WidgetPaddingAndMargin.marginAll(),
      child: MyButton(
        width: _WidgetSize().myButtonWidth,
        height: _WidgetSize().myButtonHeight,
        color: ProjectColor.redColor(),
        borderRadius: _WidgetSize().borderRadius,
        onTap: () async {
          await logoutMethod(isLoading);
        },
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Text(d!.logout,
                style: textTheme(context, ProjectColor.whiteColor(), _WidgetSize().buttonFontSize, FontWeight.normal)),
      ),
    );
  }

  TextStyle? textTheme(
    BuildContext context,
    Color color,
    double fontSize,
    FontWeight fontWeight,
  ) {
    return Theme.of(context).textTheme.labelLarge?.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );
  }
}

class _WidgetSize {
  final double myButtonHeight = 0.07;
  final double myButtonWidth = 0.8;
  final double myButtonFontSize = 17;
  final double borderRadius = 10;
  final double buttonFontSize = 18;
  final double userProfileWidth = 0.5;
  final double userProfileHeight = 0.2;
  final double circularAvatarIcon = 70;
  final double elevation = 10;
}

class _WidgetPaddingAndMargin extends EdgeInsets {
  const _WidgetPaddingAndMargin.paddingAll() : super.all(8.0);
  const _WidgetPaddingAndMargin.marginAll() : super.all(8.0);
}
