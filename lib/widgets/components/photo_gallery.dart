import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;
import 'package:widgetbook/widgetbook.dart' hide WidgetbookUseCase;

class PhotoGallery extends StatefulWidget {
  final int initialIndex;
  final List<Widget> photos;
  final TabController? controller;
  const PhotoGallery(
      {Key? key, required this.photos, this.initialIndex = 0, this.controller})
      : super(key: key);

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery>
    with TickerProviderStateMixin {
  PageChangeNotifier? _notifier;
  TabController? _controller;

  @override
  void initState() {
    initController();
    super.initState();
  }

  void pageChangeListerner() {
    _notifier!.value = _controller!.index;
  }

  void initController() {
    _controller = widget.controller ??
        TabController(
            initialIndex: widget.initialIndex,
            length: widget.photos.length,
            vsync: this);
    _notifier = PageChangeNotifier(widget.initialIndex);
    _controller!.addListener(pageChangeListerner);
  }

  List<Widget> buildItems() {
    return List.generate(widget.photos.length, (index) {
      return StatefulBuilder(builder: ((context, setState) {
        final item = widget.photos[index];

        return ValueListenableBuilder<int>(
          valueListenable: _notifier!,
          child: item,
          builder: (context, page, widget) => AnimatedPadding(
            padding: EdgeInsets.all(page == index ? 0 : 16),
            duration: const Duration(milliseconds: 500),
            child: widget,
          ),
        );
      }));
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    _notifier!.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PhotoGallery oldWidget) {
    if (widget.controller != null &&
        oldWidget.controller != null &&
        oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(pageChangeListerner);
      initController();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: TabBarView(
            controller: _controller,
            viewportFraction: 0.7,
            children: buildItems(),
          ),
        ),
        TabPageSelector(
          controller: _controller,
          selectedColor: Theme.of(context).colorScheme.secondary,
          indicatorSize: 8,
          color: Theme.of(context).disabledColor,
        ),
      ],
    );
  }
}

class PageChangeNotifier extends ValueNotifier<int> {
  PageChangeNotifier(super.value);
}

@WidgetbookUseCase(name: "primary", type: PhotoGallery)
Widget getPhotoGallery(BuildContext context) {
  return TickerProviderWrapper(builder: (context, wrapper) {
    double width = context.knobs
        .slider(label: "width", max: 1000, min: 100, divisions: 10);
    double height = context.knobs
        .slider(label: "height", max: 1000, min: 100, divisions: 10);
    final photos = List.generate(4, (i) {
      return Image.asset("assets/images/intro_picture_${i + 1}.png");
    });
    final controller = TabController(length: photos.length, vsync: wrapper);
    return Builder(builder: (context) {
      double page =
          context.knobs.slider(label: "page", max: 3, min: 0, divisions: 2);
      controller.animateTo(page.toInt());
      return Center(
        child: SizedBox(
            height: width,
            width: height,
            child: PhotoGallery(
              controller: controller,
              photos: photos,
              initialIndex: 0,
            )),
      );
    });
  });
}

class TickerProviderWrapper extends StatefulWidget {
  const TickerProviderWrapper({Key? key, required this.builder})
      : super(key: key);
  final Widget Function(BuildContext context, TickerProviderStateMixin wrapper)
      builder;
  @override
  _TickerProviderWrapperState createState() => _TickerProviderWrapperState();
}

class _TickerProviderWrapperState extends State<TickerProviderWrapper>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context, this);
  }
}
