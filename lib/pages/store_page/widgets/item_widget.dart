part of '../store_page_view.dart';

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(6),
      decoration: _decoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const _TextWidget().expanded,
          const SizedBox(width: 3),
          const _AddButton(),
        ],
      ),
    );
  }

  BoxDecoration _decoration() {
    return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(
          "https://images.pexels.com/photos/4061386/pexels-photo-4061386.jpeg?auto=compress&cs=tinysrgb&w=800",
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = 0.12.toDynamicWidth(context);
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "VUITTON SNOE",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "\$1500",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends ConsumerWidget {
  const _AddButton({
    super.key,
  });

  void _addToCart(WidgetRef ref) {
    ref.read(rCart.notifier).state++;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = 0.12.toDynamicWidth(context);
    return SizedBox(
      height: width,
      width: width,
      child: IconButton.filled(
        onPressed: () => _addToCart(ref),
        icon: const Icon(Icons.add),
        iconSize: 30,
        style: IconButton.styleFrom(
          minimumSize: Size(width, width),
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}
