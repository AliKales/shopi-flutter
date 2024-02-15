import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';

import '../../widgets/cart_widget.dart';

part 'widgets/item_widget.dart';

class StorePageView extends StatefulWidget {
  const StorePageView({super.key});

  @override
  State<StorePageView> createState() => _StorePageViewState();
}

class _StorePageViewState extends State<StorePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: Values.paddingPage(context),
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return const _ItemWidget();
          },
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("Louis Vuitton"),
      centerTitle: true,
      actions: const [
        CartWidget(),
      ],
    );
  }
}
