import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class PrimaryAvator extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final ImageProvider<Object>? backgroundImage;
  final ImageProvider<Object>? foregroundImage;
  final void Function(Object, StackTrace?)? onBackgroundImageError;
  final void Function(Object, StackTrace?)? onForegroundImageError;
  final Color? foregroundColor;
  final double? radius;
  final double? minRadius;
  final double? maxRadius;
  const PrimaryAvator(
      {Key? key,
      this.child,
      this.backgroundColor,
      this.backgroundImage,
      this.foregroundImage,
      this.onBackgroundImageError,
      this.onForegroundImageError,
      this.foregroundColor,
      this.radius = 25,
      this.minRadius,
      this.maxRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      backgroundImage: backgroundImage,
      foregroundImage: foregroundImage,
      onBackgroundImageError: onBackgroundImageError,
      onForegroundImageError: onForegroundImageError,
      radius: radius,
      maxRadius: maxRadius,
      minRadius: minRadius,
      child: child,
    );
  }
}

class OutlinedAvator extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final ImageProvider<Object>? backgroundImage;
  final ImageProvider<Object>? foregroundImage;
  final void Function(Object, StackTrace?)? onBackgroundImageError;
  final void Function(Object, StackTrace?)? onForegroundImageError;
  final Color? foregroundColor;
  final double? radius;
  final double? minRadius;
  final double? maxRadius;
  final Border? border;
  const OutlinedAvator(
      {Key? key,
      this.child,
      this.backgroundColor,
      this.backgroundImage,
      this.foregroundImage,
      this.onBackgroundImageError,
      this.onForegroundImageError,
      this.foregroundColor,
      this.radius = 25,
      this.minRadius,
      this.maxRadius,
      this.border})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: border ??
              Border.all(
                  color: Theme.of(context).colorScheme.primary, width: 1)),
      child: PrimaryAvator(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        backgroundImage: backgroundImage,
        foregroundImage: foregroundImage,
        onBackgroundImageError: onBackgroundImageError,
        onForegroundImageError: onForegroundImageError,
        radius: radius,
        maxRadius: maxRadius,
        minRadius: minRadius,
        child: child,
      ),
    );
  }
}

@WidgetbookUseCase(name: "primary", type: PrimaryAvator)
Widget getAvator(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: PrimaryAvator(
          foregroundImage: AssetImage('assets/images/intro_picture_1.png'),
        ),
      ),
    );

@WidgetbookUseCase(name: "outlined", type: OutlinedAvator)
Widget getAvator1(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: Center(
        child: OutlinedAvator(
          radius: 77,
          border: Border.all(
            width: 4,
            color: Theme.of(context).colorScheme.primary,
          ),
          foregroundImage:
              const AssetImage('assets/images/intro_picture_1.png'),
        ),
      ),
    );
