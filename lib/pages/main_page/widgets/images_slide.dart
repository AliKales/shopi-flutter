import 'dart:async';

import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:shopi/core/locale_keys.dart';

class ImagesSlide extends StatefulWidget {
  const ImagesSlide({super.key});

  @override
  State<ImagesSlide> createState() => _ImagesSlideState();
}

class _ImagesSlideState extends State<ImagesSlide> {
  final _controller = PageController();
  final pageLength = 4;

  @override
  void initState() {
    super.initState();

    Timer.periodic(3000.toDuration, (timer) {
      if (_controller.page!.toInt() == pageLength - 1) {
        _controller.jumpToPage(0);
      }
      _controller.animateToPage(
        _controller.page!.toInt() + 1,
        duration: 500.toDuration,
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: context.width / 2,
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          _firstPage(),
          const _Page(index: 2, text: LocaleKeys.goodProducts),
          const _Page(index: 3, text: LocaleKeys.goodPrices),
          _firstPage(),
        ],
      ),
    );
  }

  _Page _firstPage() => const _Page(index: 1, text: LocaleKeys.exploreStores);
}

class _Page extends StatelessWidget {
  const _Page({
    required this.text,
    required this.index,
  });

  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        gradient: const LinearGradient(
          colors: [Colors.black, Colors.transparent],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/pictures/slide-pic-$index.jpg"),
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(196, 0, 0, 0),
                  Color.fromARGB(153, 0, 0, 0),
                  Colors.transparent
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                text,
                style: context.textTheme.displaySmall!.toBold.toWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
