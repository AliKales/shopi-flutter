import 'dart:developer';

import 'package:caroby/caroby.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Function name for router", () {
    log(router.name);
    log(router.path);
    print("object");
  });
}

String router(String val) => "";
