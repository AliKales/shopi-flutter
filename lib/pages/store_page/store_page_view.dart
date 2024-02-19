import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopi/core/riverpod/r_cart_counter.dart';
import 'package:shopi/pages/store_page/mixin_store_page.dart';

import '../../widgets/cart_widget.dart';

part 'widgets/item_widget.dart';

class StorePageView extends StatefulWidget {
  const StorePageView({super.key, required this.name, required this.linkName});

  final String name;
  final String linkName;

  @override
  State<StorePageView> createState() => _StorePageViewState();
}

class _StorePageViewState extends State<StorePageView> with MixinStorePage {
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
      title: Text(widget.name),
      centerTitle: true,
      actions: const [
        CartWidget(),
      ],
    );
  }
}
