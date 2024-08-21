part of 'home_view.dart';

class _ProductCategory extends StatelessWidget {
  const _ProductCategory({
    super.key,
  });
  final double _sizedBoxHeight = 120;
  final double _textFontSize = 13;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _sizedBoxHeight,
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
              return _categories(uniqueCategories, index, context);
            },
          );
        },
      ),
    );
  }

  Column _categories(List<String?>? uniqueCategories, int index, BuildContext context) {
    return Column(
      children: [
        CircularCardWidget(
          text: uniqueCategories?[index]?.characters.first.toUpperCase() ?? '',
          onTap: () {
            return _choiseCategory(uniqueCategories, index, context);
          },
        ),
        Text(
          uniqueCategories?[index]?.toUpperCase() ?? '',
          style: textTheme(context, ProjectColor.darkColor(), _textFontSize, FontWeight.bold),
        ),
      ],
    );
  }

  Object _choiseCategory(List<String?>? uniqueCategories, int index, BuildContext context) {
    switch (uniqueCategories?[index]) {
      case 'beauty':
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailView(filterText: ProjectString.beauty.projectToString())));
      case 'fragrances':
        return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailView(filterText: ProjectString.fragrances.projectToString())));
      case 'furniture':
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailView(filterText: ProjectString.furniture.projectToString())));
      case 'groceries':
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailView(filterText: ProjectString.groceries.projectToString())));

      default:
        return const Center(
          child: Text('Not defined'),
        );
    }
  }
}
