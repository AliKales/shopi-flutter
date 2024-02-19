part of '../cart_page_view.dart';

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    super.key,
  });

  double _height(BuildContext context) => 0.27.toDynamicWidth(context);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: _height(context),
        child: Row(
          children: [
            _Image(size: _height(context)),
            const SizedBox(width: 10),
            const _Texts().expanded,
            const _RightActions(),
          ],
        ),
      ),
    );
  }
}

class _RightActions extends StatelessWidget {
  const _RightActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("L"),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete),
          color: context.colorScheme.error,
        ),
      ],
    );
  }
}

class _Texts extends StatelessWidget {
  const _Texts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Simple Hoodie",
            style: context.textTheme.titleMedium!.toBold,
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
          Text(
            "\$12.42",
            style: context.textTheme.titleMedium!.toBold,
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton.outlined(
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: const Icon(Icons.remove),
                iconSize: 16,
              ),
              Text(
                "1",
                style: context.textTheme.titleMedium!.toBold,
              ),
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.add),
                iconSize: 16,
                constraints: const BoxConstraints(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Image.network(
        "https://images.pexels.com/photos/4061386/pexels-photo-4061386.jpeg?auto=compress&cs=tinysrgb&w=800",
        fit: BoxFit.cover,
        height: size,
        width: size,
      ),
    );
  }
}
