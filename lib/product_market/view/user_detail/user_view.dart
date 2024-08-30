import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/auth/cubit/login_cubit.dart';
import 'package:product_app/auth/cubit/user_cubit.dart';
import 'package:product_app/auth/cubit/user_cubit_sate.dart';
import 'package:product_app/auth/model/user_model.dart';
import 'package:product_app/product_market/product/mixin/categories_mixin.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/product/utils/lottie/loading_lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:product_app/product_market/product/widget/my_button.dart';
import 'package:product_app/product_market/view/user_detail/user_state.dart';

part 'user.g.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends UserState<UserView> {
  @override
  Widget build(BuildContext context) {
    var d = AppLocalizations.of(context);
    return Scaffold(
      body: BlocBuilder<UserCubit, UserCubitSate>(
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

  Widget _buildUI({required BuildContext context, required Users filteredProducts}) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _userProfileView(filteredProducts: filteredProducts),
              _userDetails(context: context, filteredProducts: filteredProducts),
              _logoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userDetails({required BuildContext context, required Users filteredProducts}) {
    var d = AppLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _user(text: '${d!.name}: ${filteredProducts.firstName}', icon: Icons.supervised_user_circle_rounded),
        _user(text: '${d.surname}: ${filteredProducts.lastName}', icon: Icons.supervised_user_circle_rounded),
        _user(text: '${d.userName}: ${filteredProducts.username}', icon: Icons.data_saver_off_rounded),
        _user(text: filteredProducts.email, icon: Icons.email),
      ],
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

  Widget _user({required String text, required IconData icon}) {
    return Container(
      margin: const _WidgetPaddingAndMargin.marginAll(),
      padding: const _WidgetPaddingAndMargin.paddingAll(),
      width: MediaQuery.of(context).size.width * _WidgetSize().userWidth,
      height: MediaQuery.of(context).size.height * _WidgetSize().userHeight,
      decoration: _userBoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _utext(text, context),
          Icon(icon, color: ProjectColor.flushOrange()),
        ],
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
}
