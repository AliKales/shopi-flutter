import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopi/core/riverpod/r_cart.dart';

class CartWidget extends ConsumerWidget {
  const CartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(rCart);
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        width: 0.06.toDynamicWidth(context),
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/svgs/shopping-cart.svg",
            ),
            if (count > 0)
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 0.05.toDynamicWidth(context),
                  height: 0.05.toDynamicWidth(context),
                  decoration: BoxDecoration(
                      color: context.colorScheme.error,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16))),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "$count",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
