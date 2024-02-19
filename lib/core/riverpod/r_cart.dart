import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopi/service/service_user.dart';

final rCart = AsyncNotifierProvider.autoDispose<RCart, List>(
  RCart.new,
);

class RCart extends AutoDisposeAsyncNotifier<List> {
  @override
  Future<List> build() async {
    await ServiceUser.getCart();
    return [];
  }
}
