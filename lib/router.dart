import 'dart:io';

import 'package:caroby/caroby.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopi/pages/auth/login_page/login_page_view.dart';
import 'package:shopi/pages/auth/signup_page/signup_page_view.dart';
import 'package:shopi/pages/cart_page/cart_page_view.dart';
import 'package:shopi/pages/index_page/index_page_view.dart';
import 'package:shopi/pages/loading_page/loading_page_view.dart';
import 'package:shopi/pages/main_page/main_page_view.dart';
import 'package:shopi/pages/store_page/store_page_view.dart';
import 'package:shopi/service/auth.dart';

abstract class PagePaths {
  PagePaths._();

  static String index = "/";
  static String login = "/login";
  static String signup = "/signup";
  static String main = "/main";
  static String loading = "/loading";
  static String store({String? name, String? linkName, int? id}) =>
      "/store?name=$name&linkName=$linkName&id=$id";
  static String cart = "/cart";
}

final appRouter = GoRouter(
  initialLocation: PagePaths.loading,
  redirect: (context, state) {
    if (!Auth.isLoggedIn &&
        !state.isAtAny([
          PagePaths.login,
          PagePaths.index,
          PagePaths.signup,
          PagePaths.loading
        ])) {
      return PagePaths.login;
    }
    return null;
  },
  routes: [
    AppRoute(PagePaths.index, (s) => const IndexPageView()),
    AppRoute(PagePaths.login, (s) => const LoginPageView()),
    AppRoute(PagePaths.signup, (s) => const SignupPageView()),
    AppRoute(PagePaths.main, (s) => const MainPageView()),
    AppRoute(PagePaths.loading, (s) => const LoadingPageView()),
    AppRoute(
      PagePaths.store.path,
      (s) => StorePageView(
        linkName: s.getParam<String>("linkName") ?? "",
        name: s.getParam<String>("name") ?? "",
        id: s.getParam<int>("id"),
      ),
    ),
    AppRoute(PagePaths.cart, (s) => const CartPageView()),
  ],
);

class AppRoute extends GoRoute {
  AppRoute(
    String path,
    Widget Function(GoRouterState s) child,
  ) : super(
          path: path,
          pageBuilder: (context, state) {
            if (Platform.isIOS) {
              return CupertinoPage(child: child.call(state));
            }
            return MaterialPage(child: child.call(state));
          },
        );
}

extension ExtGoRouter on GoRouter {
  String get location {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();

    return location;
  }
}

extension ExtGoRouterState on GoRouterState {
  Map<String, dynamic> get params {
    final q = uri.queryParameters;

    Map<String, dynamic> convertedMap = {};

    q.forEach((key, value) {
      if (int.tryParse(value) != null) {
        convertedMap[key] = int.parse(value);
      } else if (double.tryParse(value) != null) {
        convertedMap[key] = double.parse(value);
      } else if (value.toLowerCase() == 'true' ||
          value.toLowerCase() == 'false') {
        convertedMap[key] = value.toLowerCase() == 'true';
      } else {
        convertedMap[key] = value;
      }
    });

    return convertedMap;
  }

  T? getParam<T>(String key) {
    final p = params;

    if (!p.containsKey(key) || p[key] == null || p[key] == "null") return null;

    if (T is bool) {
      return bool.tryParse(p[key]) as T;
    }

    return p[key];
  }

  ///[isAt] check if given path is current path
  bool isAt(String path) {
    return fullPath?.contains(path) ?? false;
  }

  ///[isAt] check if given path is current path
  bool isAtAny(List<String> path) {
    final i = path
        .indexWhere((e) => e.contains(fullPath?.replaceFirst("/", "") ?? ""));
    return i == -1 ? false : true;
  }
}
