part of 'home_view.dart';

class _ProdoctBeautyList extends StatelessWidget {
  const _ProdoctBeautyList({
    super.key,
  });
  final _filterText = 'beauty';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _WidgetSize().sizedBoxHeight,
      child: BlocBuilder<ProductCubit, ProductCubitState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final filteredProducts = state.item!.where((product) => product.category == _filterText).toList();

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: filteredProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return _ProductBeautyCard(model: filteredProducts[index]);
            },
          );
        },
      ),
    );
  }
}

class _ProductBeautyCard extends StatelessWidget {
  const _ProductBeautyCard({
    super.key,
    required Products? model,
  }) : _model = model;
  final Products? _model;
  @override
  Widget build(BuildContext context) {
    return ProductCardWidget(
      image: _model?.thumbnail ?? '',
      title: _model?.title ?? '',
      price: _model?.price ?? 0,
      rating: _model?.rating ?? 0,
      onTap: () {},
    );
  }
}

class _WidgetSize {
  final int length = 0;
  final int flexSize = 6;
  final double sizedBoxHeight = 280;
}
