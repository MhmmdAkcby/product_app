import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product/cubit/product_cubit.dart';
import 'package:product_app/product/cubit/product_cubit_state.dart';
import 'package:product_app/product/product/constant/color/project_color.dart';

class NawDrawerWidget extends StatelessWidget {
  const NawDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DrawerHeader(
              decoration: BoxDecoration(color: ProjectColor.flushOrange()),
              child: Text(
                'Categories',
                style: textTheme(context, ProjectColor.whiteColor(), 30, FontWeight.w300),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductCubit, ProductCubitState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                final uniqueCategories = state.item?.map((item) => item.category).toSet().toList();

                return ListView.builder(
                  itemCount: uniqueCategories?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(uniqueCategories?[index]?.toUpperCase() ?? ''),
                    );
                  },
                  padding: EdgeInsets.zero,
                );
              },
            ),
          ),
        ],
      ),
    );
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
