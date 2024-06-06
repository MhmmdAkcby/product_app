part of 'home_view.dart';

class _ProductCategory extends StatelessWidget {
  const _ProductCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: BlocBuilder<ProductCubit, ProductCubitState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final uniqueCategories = state.item?.map((item) => item.category).toSet().toList();
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: uniqueCategories?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return CircularCardWidget(text: uniqueCategories?[index] ?? '');
            },
          );
        },
      ),
    );
  }
}
