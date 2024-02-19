import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:shopi/models/m_store.dart';
import 'package:shopi/pages/store_page/store_page_view.dart';
import 'package:shopi/service/service_store.dart';

mixin MixinStorePage on State<StorePageView> {
  MStore? store;

  @override
  void initState() {
    super.initState();
    context.afterBuild((p0) => _load());
  }

  Future<void> _load() async {
    store = await ServiceStore.getStore(getLinkName());
    setState(() {});
  }

  //we check if link is only number,
  //if so then it means it is current user's store
  //because we send only store id which is int
  //when we open current user's store
  bool get isMyStore {
    return int.tryParse(getLinkName()) != null;
  }

  String getLinkName();
}
