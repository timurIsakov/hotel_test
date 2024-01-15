import 'package:flutter/material.dart';

class PhotoViewWidget extends StatefulWidget {
  final List<String> photos;
  const PhotoViewWidget({Key? key, required this.photos}) : super(key: key);

  @override
  State<PhotoViewWidget> createState() => _PhotoViewWidgetState();
}

class _PhotoViewWidgetState extends State<PhotoViewWidget> {
  late final PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        ...List.generate(widget.photos.length, (index) => const SizedBox())
      ],
    );
  }
}
