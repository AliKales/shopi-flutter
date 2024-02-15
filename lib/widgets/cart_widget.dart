import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        width: 0.06.toDynamicWidth(context),
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/svgs/shopping-cart.svg",
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 0.05.toDynamicWidth(context),
                height: 0.05.toDynamicWidth(context),
                decoration: BoxDecoration(
                    color: context.colorScheme.error,
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                child: const FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.white),
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
