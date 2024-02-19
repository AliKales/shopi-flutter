part of '../main_page_view.dart';

class _StoreWidget extends StatelessWidget {
  const _StoreWidget({
    required this.name,
    required this.linkName,
    required this.imageUrl,
  });

  final String name;
  final String linkName;
  final String imageUrl;

  void _go(BuildContext context) {
    context.push(PagePaths.store(name, linkName));
  }

  @override
  Widget build(BuildContext context) {
    final width = 0.7.toDynamicWidth(context);
    return SizedBox(
      width: width,
      child: Column(
        children: [
          _image(width),
          _button(context),
        ],
      ),
    );
  }

  Padding _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Buttons(
        context,
        name,
        () => _go(context),
        background: Colors.black,
        icon: const Icon(Icons.arrow_forward_ios, size: 15),
      ).filled(),
    );
  }

  ClipRRect _image(double width) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        height: width * 1.4,
        width: width,
      ),
    );
  }
}
