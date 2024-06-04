part of 'home_view.dart';

class _ProdoctBeautyList extends StatelessWidget {
  const _ProdoctBeautyList({
    super.key,
  });
  final _filterText = 'beauty';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: BlocBuilder<ProductCubit, ProductCubitState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: state.item?.length ?? _WidgetSize().length,
            itemBuilder: (BuildContext context, int index) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              final filter = state.item?[index].category;
              if (filter == _filterText) {
                return _ProductBeautyCard(model: state.item?[index]);
              }
              return null;
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
    return SizedBox(
      width: MediaQuery.of(context).size.width * _WidgetSize().width,
      child: Card(
        child: Column(
          children: [
            Image.network(_model?.thumbnail ?? ''),
            Text(_model?.title ?? ''),
            _priceAndRatingInfoText(),
          ],
        ),
      ),
    );
  }

  Padding _priceAndRatingInfoText() {
    return Padding(
      padding: _WidgetPadding.onlyPriceRating(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Price : ${_model?.price}'),
          Text('Rating:  ${_model?.rating}'),
        ],
      ),
    );
  }
}

class _WidgetSize {
  final int length = 0;
  final double width = 0.5;
}

class _WidgetPadding extends EdgeInsets {
  const _WidgetPadding.onlyPriceRating() : super.only(top: 4, left: 4, right: 4);
}
