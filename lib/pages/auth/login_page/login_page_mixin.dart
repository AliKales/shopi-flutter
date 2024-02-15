// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:caroby/caroby.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shopi/core/locale_keys.dart';
import 'package:shopi/pages/auth/login_page/login_page_view.dart';
import 'package:shopi/router.dart';
import 'package:shopi/service/auth.dart';

mixin LoginPageMixin on State<LoginPageView> {
  final formKey = GlobalKey<FormState>();
  final tECUsername = TextEditingController();
  final tECPassword = TextEditingController();

  @override
  void dispose() {
    tECUsername.dispose();
    tECPassword.dispose();
    super.dispose();
  }

  void showError(String text);

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    CustomProgressIndicator.showProgressIndicatorMessage(context,
        text: LocaleKeys.loggingIn);

    final result = await Auth.login(tECUsername.textTrim, tECPassword.textTrim);

    context.pop();

    switch (result.status) {
      case HttpStatus.ok:
        _goMain();
        break;
      case HttpStatus.notFound:
        showError(LocaleKeys.usernamePasswordWrong);
        break;
      case HttpStatus.forbidden:
        //go verify email;
        showError("Verify email");
        break;
      default:
        showError(LocaleKeys.unexpectedError);
    }
  }

  void _goMain() => context.go(PagePaths.main);

  void signup() {}

  void loginGoogle() {}

  void loginApple() {
    if (!Platform.isIOS) return;
  }

  void forgetPassword() {}
}
