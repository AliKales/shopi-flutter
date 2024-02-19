import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopi/models/m_store.dart';
import 'package:shopi/pages/main_page/main_page_view.dart';
import 'package:shopi/router.dart';
import 'package:shopi/service/auth.dart';
import 'package:shopi/service/service_store.dart';

mixin MixinMainPage on State<MainPageView> {
  final key = GlobalKey<ScaffoldState>();

  List<MStore> stores = [];

  @override
  void initState() {
    super.initState();
    context.afterBuild((p0) => _getNewestStores());
  }

  Future<void> _getNewestStores() async {
    stores = await ServiceStore.getNewestStores() ?? [];
    setState(() {});
  }

  void goMyStore() {
    closeDrawer();

    if (Auth.me!.storeId != null) {
      context.push(PagePaths.store(id: Auth.me!.storeId));
      return;
    }
  }

  void closeDrawer() => key.currentState!.closeDrawer();
}
