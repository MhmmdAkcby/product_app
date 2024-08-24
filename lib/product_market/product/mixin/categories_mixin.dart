import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product_market/cubit/product_cubit.dart';
import 'package:product_app/product_market/cubit/product_cubit_state.dart';
import 'package:product_app/product_market/product/utils/lottie/loading_lottie.dart';
import 'package:product_app/product_market/product/utils/project_string.dart';
import 'package:product_app/product_market/product/widget/card/circular_card_widget.dart';
import 'package:product_app/product_market/view/home/home_state.dart';

mixin CategoriesMixin {
  Widget categories({required bool isCircular, Axis scrollDirection = Axis.vertical}) {
    return _Categories(isCircular: isCircular, scrollDirection: scrollDirection);
  }
}

class _Categories extends StatefulWidget {
  const _Categories({super.key, required this.isCircular, this.scrollDirection = Axis.vertical});
  final bool isCircular;
  final Axis scrollDirection;

  @override
  State<_Categories> createState() => _CategoriesState();
}

class _CategoriesState extends HomeState<_Categories> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductCubitState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const LoadingLottie();
        }

        final uniqueCategories = state.item?.map((item) => item.category).toSet().toList() ?? [];

        return ListView.builder(
          itemCount: uniqueCategories.length,
          scrollDirection: widget.scrollDirection,
          itemBuilder: (context, index) {
            return _buildCategoryItem(uniqueCategories[index], context);
          },
        );
      },
    );
  }

  Widget _buildCategoryItem(String? category, BuildContext context) {
    return widget.isCircular
        ? CircularCardWidget(
            text: category?.characters.first.toUpperCase() ?? '',
            data: category?.characters.string.toUpperCase() ?? '',
            onTap: () => _chooseCategory(category, context),
          )
        : ListTile(
            title: Text(category?.toUpperCase() ?? ''),
            onTap: () => _chooseCategory(category, context),
          );
  }

  void _chooseCategory(String? category, BuildContext context) {
    switch (category) {
      case 'beauty':
        navigatorService.pushNamed("/detailView", arguments: ProjectString.beauty.projectToString());
        break;
      case 'fragrances':
        navigatorService.pushNamed("/detailView", arguments: ProjectString.fragrances.projectToString());
        break;
      case 'furniture':
        navigatorService.pushNamed("/detailView", arguments: ProjectString.furniture.projectToString());
        break;
      case 'groceries':
        navigatorService.pushNamed("/detailView", arguments: ProjectString.groceries.projectToString());
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Category not defined')));
        break;
    }
  }
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
