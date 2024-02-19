import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopi/core/locale_keys.dart';
import 'package:shopi/core/riverpod/r_cart.dart';
import 'package:shopi/widgets/buttons.dart';
import 'package:shopi/widgets/cart_widget.dart';

part 'widgets/item_widget.dart';
part 'widgets/price_widget.dart';

class CartPageView extends ConsumerWidget {
  const CartPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(rCart);
    return Scaffold(
      appBar: _appBar(0),
      body: Padding(
        padding: Values.paddingPage(context),
        child: switch (cart) {
          AsyncData(:final value) => Text('Activity: $value'),
          AsyncError(:final error) =>
            Text('Oops, something unexpected happened${error.toString()}'),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: 0,
          itemBuilder: (context, index) {
            return const _ItemWidget();
          },
        ).expanded,
        const _PriceWidget(),
        Buttons(context, LocaleKeys.checkout, () {}).filled(),
      ],
    );
  }

  AppBar _appBar(int count) {
    return AppBar(
      title: const Text(LocaleKeys.cart),
      centerTitle: true,
      actions: [
        CartWidget(isClickable: false, value: count),
      ],
    );
  }
}
