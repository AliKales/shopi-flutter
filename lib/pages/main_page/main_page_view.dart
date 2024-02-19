import 'package:caroby/caroby.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopi/core/locale_keys.dart';
import 'package:shopi/models/m_store.dart';
import 'package:shopi/pages/main_page/mixin_main_page.dart';
import 'package:shopi/pages/main_page/widgets/images_slide.dart';
import 'package:shopi/router.dart';
import 'package:shopi/service/auth.dart';
import 'package:shopi/widgets/buttons.dart';
import 'package:shopi/widgets/c_text_field.dart';
import 'package:shopi/widgets/cart_widget.dart';

import '../../widgets/avatar_widget.dart';

part 'widgets/store_widget.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> with MixinMainPage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: _appBar(),
      drawer: _drawer(),
      body: Padding(
        padding: Values.paddingPage(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: ImagesSlide(),
              ),
              const CTextField(
                prefixIcon: Icon(Icons.search),
                filled: true,
                label: "${LocaleKeys.searchStore}..",
              ),
              const Divider(),
              Text(
                LocaleKeys.newestStores,
                style: context.textTheme.displaySmall!.toBold,
              ).left,
              const SizedBox(height: 15),
              ...List.generate(
                stores.length,
                (index) {
                  MStore s = stores[index];
                  return _StoreWidget(
                    name: s.name ?? "",
                    linkName: s.linkName ?? "",
                    imageUrl:
                        "https://images.pexels.com/photos/1233648/pexels-photo-1233648.jpeg?auto=compress&cs=tinysrgb&w=800",
                  );
                },
              ),
              const _StoreWidget(
                name: "Louis Vuitton",
                linkName: "louivuitton",
                imageUrl:
                    "https://images.pexels.com/photos/14319768/pexels-photo-14319768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2a",
              ),
              const _StoreWidget(
                name: "Gucci",
                linkName: "gucci",
                imageUrl:
                    "https://images.pexels.com/photos/13183414/pexels-photo-13183414.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
              ),
              const _StoreWidget(
                name: "Dior",
                linkName: "dior",
                imageUrl:
                    "https://images.pexels.com/photos/14398297/pexels-photo-14398297.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
              ),
              const _StoreWidget(
                name: "Prada",
                linkName: "prada",
                imageUrl:
                    "https://images.pexels.com/photos/13379800/pexels-photo-13379800.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
              ),
              const _StoreWidget(
                name: "Chanel",
                linkName: "Chanel",
                imageUrl:
                    "https://images.pexels.com/photos/14050823/pexels-photo-14050823.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: kToolbarHeight * 0.8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvatarWidget(
              size: 0.23.toDynamicWidth(context),
              url:
                  "https://images.pexels.com/photos/634021/pexels-photo-634021.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            ),
            Text(
              Auth.me?.username ?? "",
              style: context.textTheme.titleLarge!.toBold,
            ),
            const Divider(),
            ListTile(
              onTap: goMyStore,
              title: const Text(LocaleKeys.myStore),
              leading: const Icon(Icons.storefront_outlined),
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              onTap: () => Auth.logout(),
              title: const Text(LocaleKeys.logout),
              leading: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(LocaleKeys.appName),
      actions: const [
        CartWidget(),
      ],
    );
  }
}
