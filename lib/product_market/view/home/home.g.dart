part of 'home_view.dart';

class _ProductCategory extends StatelessWidget with CategoriesMixin {
  const _ProductCategory({
    super.key,
  });

  final double _sizedBoxHeight = 120;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _sizedBoxHeight,
      child: categories(isCircular: true, scrollDirection: Axis.horizontal),
    );
  }
}
