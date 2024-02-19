import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopi/core/locale_keys.dart';
import 'package:shopi/core/riverpod/r_cart_counter.dart';
import 'package:shopi/pages/store_page/mixin_store_page.dart';

import '../../widgets/cart_widget.dart';

part 'widgets/item_widget.dart';

class StorePageView extends StatefulWidget {
  const StorePageView(
      {super.key, required this.name, required this.linkName, this.id});

  final String name;
  final String linkName;
  final int? id;

  @override
  State<StorePageView> createState() => _StorePageViewState();
}

class _StorePageViewState extends State<StorePageView> with MixinStorePage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(LocaleKeys.createProduct),
        icon: const Icon(Icons.add),
      ),
      body: Padding(
        padding: Values.paddingPage(context),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return const _ItemWidget();
          },
        ),
      ),
    );
  }

  AppBar _appBar() {
    final title = store?.name ?? widget.name;
    return AppBar(
      title: Text(title.toUpperCase()),
      centerTitle: true,
      actions: const [
        CartWidget(),
      ],
    );
  }

  @override
  String getLinkName() => widget.id?.toString() ?? widget.linkName;
}
