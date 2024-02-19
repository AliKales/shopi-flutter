part of '../cart_page_view.dart';

class _PriceWidget extends StatelessWidget {
  const _PriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 0.5)),
      ),
      child: Column(
        children: [
          _firstText(context, "${LocaleKeys.subTotal}:", "\$120.00"),
          _firstText(context, "${LocaleKeys.shipping}:", "\$10.50"),
          const Divider(),
          _firstText(context, "${LocaleKeys.total}:", "\$130.50", true),
        ],
      ),
    );
  }

  Widget _firstText(
    BuildContext context,
    String label,
    String price, [
    bool isTotal = false,
  ]) {
    var priceStyle = context.textTheme.titleLarge!.toBold;
    if (isTotal) {
      priceStyle = priceStyle.copyWith(color: context.colorScheme.primary);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textTheme.titleMedium!.toBold,
          ),
          Text(
            price,
            style: priceStyle,
          ),
        ],
      ),
    );
  }
}
