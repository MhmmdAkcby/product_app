import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product_market/cubit/product_cubit.dart';
import 'package:product_app/product_market/model/product_model.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/product/mixin/image_zoom_mixin.dart';
import 'package:product_app/product_market/product/widget/card/detail_product_widget/detail_product_state.dart';
import 'package:product_app/product_market/product/widget/draw_widget/naw_drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:product_app/product_market/product/widget/my_button.dart';

part 'part_of_detail_product.g.dart';

class DetailsProductWidget extends StatefulWidget {
  const DetailsProductWidget({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.description,
    required this.stock,
    required this.category,
    required this.tags,
    required this.brands,
    required this.dimensionsDeth,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.dimensionsHeight,
    required this.dimensionsWidht,
    required this.reviews,
    required this.id,
  });
  final String image;
  final String title;
  final String description;
  final String category;
  final String tags;
  final String brands;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;

  final double price;
  final double rating;
  final double dimensionsDeth;
  final double dimensionsHeight;
  final double dimensionsWidht;

  final int id;
  final int stock;

  final List<Reviews>? reviews;

  @override
  State<DetailsProductWidget> createState() => _DetailsProductWidgetState();
}

class _DetailsProductWidgetState extends DetailProductState<DetailsProductWidget> with ImageZoomMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const _WidgetPadding.scrolViewOnly(),
            child: Padding(
              padding: const _WidgetPadding.all(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _imageNetwork(context, widget.image),
                  _productDescription(context),
                  _showProductInfo(context),
                  _showReviews(context),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _bottomPriceAndRatingContainer(context, widget.price, widget.rating),
          ),
        ],
      ),
    );
  }

  Widget _productDescription(BuildContext context) {
    return Container(
      child: Padding(
        padding: const _WidgetPadding.all(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productTexts(context, widget.title),
            const Divider(),
            _descriptionText(context),
          ],
        ),
      ),
    );
  }

  Widget _descriptionText(BuildContext context) {
    final isAllTextShow = context.watch<ProductCubit>().state.isAllTextShow;
    return Column(
      children: [
        _productTexts(context, widget.description),
        _textButton(context, isAllTextShow),
      ],
    );
  }

  Widget _textButton(BuildContext context, bool isAllTextShow) {
    var d = AppLocalizations.of(context);
    return TextButton(
      onPressed: () {
        context.read<ProductCubit>().toggleShowText();
      },
      child: isAllTextShow ? Text(d!.productShowLess) : Text(d!.productShowMore),
    );
  }

  Widget _productTexts(BuildContext context, String text) {
    final isAllTextShow = context.watch<ProductCubit>().state.isAllTextShow;

    return Padding(
      padding: const _WidgetPadding.only(),
      child: Text(
        text,
        style: _textStyle(context),
        overflow: isAllTextShow ? null : TextOverflow.ellipsis,
      ),
    );
  }

  Widget _imageNetwork(BuildContext context, String image) {
    var d = AppLocalizations.of(context);
    return Stack(
      children: [
        InkWell(
          onTap: () {
            imageZoom(context, image);
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.43,
            child: Image.network(image, fit: BoxFit.cover),
          ),
        ),
        _smallCardShowImage(context, d!.superOpportunity, ProjectColor.infernoOrange(), _WidgetSize().smallCardBottom1,
            _WidgetSize().smallCardRight1, _WidgetSize().smalCardWidth1),
        _smallCardShowImage(context, d.suitableProduct, ProjectColor.amberColor(), _WidgetSize().smallCardBottom2,
            _WidgetSize().smallCardRight2, _WidgetSize().smalCardWidth2),
      ],
    );
  }

  Widget _bottomPriceAndRatingContainer(BuildContext context, double price, double rating) {
    var d = AppLocalizations.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * _WidgetSize().bottomPriceAndRatingContainerHeight,
      decoration: _bottomPriceRaitingContainerDecoration(),
      width: double.infinity,
      padding: const _WidgetPadding.allx2(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _priceAndRaiting(d, price, context, rating),
          _myButton(d!.buy, ProjectColor.flushOrange()),
          _addCartButton(),
        ],
      ),
    );
  }

  Widget _addCartButton() {
    return Card(
      child: IconButton(
        icon: const Icon(Icons.shopping_cart_rounded),
        onPressed: () {
          final product = Products(
            id: widget.id,
            title: widget.title,
            images: [widget.image],
            price: widget.price,
            rating: widget.rating,
          );

          context.read<ProductCubit>().addToCart(product);

          navigatorService.pushReplacementNamed("/cart", arguments: widget.id);
          alertMessage();
        },
      ),
    );
  }

  Widget _showProductInfo(BuildContext context) {
    List<Map<String, String>> productDetails = _productDetails(context);

    return Container(
      child: Padding(
        padding: const _WidgetPadding.all(),
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
          },
          border: TableBorder(
            horizontalInside: BorderSide(
              width: 1,
              color: ProjectColor.greyShade(),
              style: BorderStyle.solid,
            ),
          ),
          children: productDetails.map((detail) {
            return TableRow(
              children: [
                Padding(
                  padding: const _WidgetPadding.symmetric(),
                  child: Text(
                    detail['title']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const _WidgetPadding.symmetric(),
                  child: Text(detail['value']!),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  List<Map<String, String>> _productDetails(BuildContext context) {
    const String title = 'title';
    const String value = 'value';
    var d = AppLocalizations.of(context);
    final productDetails = [
      {title: d!.category, value: widget.category},
      {title: d.tags, value: widget.tags},
      {title: d.brands, value: widget.brands},
      {title: d.depth, value: widget.dimensionsDeth.toString()},
      {title: d.height, value: widget.dimensionsHeight.toString()},
      {title: d.width, value: widget.dimensionsWidht.toString()},
      {title: d.availabilityStatus, value: widget.availabilityStatus},
      {title: d.shippingInformation, value: widget.shippingInformation},
      {title: d.warrantyInformation, value: widget.warrantyInformation},
    ];
    return productDetails;
  }

  Widget _showReviews(BuildContext context) {
    var d = AppLocalizations.of(context);
    if (widget.reviews == null || widget.reviews!.isEmpty) {
      return Card(
        child: ListTile(
          title: Text(d!.noReviewsAvailable),
        ),
      );
    }

    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text(d!.reviews),
          ),
          for (var review in widget.reviews!)
            Card(
              color: ProjectColor.whiteColor(),
              child: ListTile(
                title: Text(review.reviewerName ?? d.anonymous),
                subtitle: Text(review.comment ?? d.noComment),
                trailing: Text(List.generate(
                  review.rating ?? 0,
                  (index) => '★',
                ).join()),
                leading: CircleAvatar(
                  child: Text(review.reviewerName?.characters.first ?? ''),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
