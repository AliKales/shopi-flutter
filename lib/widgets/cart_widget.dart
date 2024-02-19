import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopi/core/riverpod/r_cart_counter.dart';
import 'package:shopi/router.dart';

class CartWidget extends ConsumerWidget {
  const CartWidget({
    super.key,
    this.isClickable = true,
    this.value,
  });

  final bool isClickable;
  final int? value;

  void _onTap(BuildContext context) {
    if (!isClickable) return;
    context.push(PagePaths.cart);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = value ?? ref.watch<int>(rCartCounter);
    return InkWell(
      onTap: () => _onTap(context),
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: SizedBox(
          child: Badge.count(
            count: count,
            isLabelVisible: count > 0,
            child: SvgPicture.asset(
              "assets/svgs/shopping-cart.svg",
              width: 0.06.toDynamicWidth(context),
              height: 0.06.toDynamicWidth(context),
            ),
          ),
        ),
      ),
    );
  }
}
