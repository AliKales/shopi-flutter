import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopi/core/locale_keys.dart';
import 'package:shopi/router.dart';
import 'package:shopi/widgets/buttons.dart';

class IndexPageView extends StatelessWidget {
  const IndexPageView({super.key});

  void _start(BuildContext context) => context.go(PagePaths.login);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Values.paddingPage(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/gifs/supermarket-mart.gif",
              width: 0.5.toDynamicWidth(context),
            ),
            Column(
              children: [
                Text(
                  LocaleKeys.appName,
                  style: context.textTheme.displaySmall!.toBold,
                ),
                Text(
                  LocaleKeys.startText,
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
            Buttons(
              context,
              LocaleKeys.getStarted,
              () => _start(context),
            ).filled(),
          ],
        ).center,
      ),
    );
  }
}
