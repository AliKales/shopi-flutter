// ignore_for_file: use_build_context_synchronously

import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopi/core/locale_keys.dart';
import 'package:shopi/router.dart';
import 'package:shopi/service/auth.dart';

import '../../core/h_hive.dart';

class LoadingPageView extends StatefulWidget {
  const LoadingPageView({super.key});

  @override
  State<LoadingPageView> createState() => _LoadingPageViewState();
}

class _LoadingPageViewState extends State<LoadingPageView>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: 1500.toDuration, vsync: this);
    animation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(-1.5, 0))
            .animate(controller)
          ..addListener(() {
            if (controller.isCompleted) {
              controller.repeat();
            }
          });

    controller.forward();

    context.afterBuild((p0) => _afterBuild());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _afterBuild() async {
    await Future.delayed(1500.toDuration);
    await HHive.init();
    await Auth.init();

    if (Auth.isLoggedIn) {
      final r = await Auth.getMe();
      if (!r.isOk) {
        context.go(PagePaths.index);
        return;
      }
      context.go(PagePaths.main);
    } else {
      context.go(PagePaths.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.appName),
        centerTitle: true,
      ),
      body: Padding(
        padding: Values.paddingPage(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: animation,
              child: Image.asset(
                "assets/gifs/supermarket-mart.gif",
                width: 0.5.toDynamicWidth(context),
              ),
            ),
            const LinearProgressIndicator(
              minHeight: 15,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            const SizedBox(height: kToolbarHeight),
          ],
        ).center,
      ),
    );
  }
}
