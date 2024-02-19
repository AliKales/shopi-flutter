import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:shopi/pages/store_page/store_page_view.dart';
import 'package:shopi/service/service_store.dart';

mixin MixinStorePage on State<StorePageView> {
  @override
  void initState() {
    super.initState();
    context.afterBuild((p0) => _load());
  }

  void _load() {
    ServiceStore.getStore("caroby");
  }
}
