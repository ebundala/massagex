import 'package:flutter/material.dart';
import 'package:massagex/widgets/components/swipable_button/swipable_button.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;

  final void Function()? onPressed;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  const PrimaryButton(
      {Key? key,
      required this.child,
      this.onPressed,
      this.height = kMinInteractiveDimension,
      this.color,
      this.width,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context)
            .elevatedButtonTheme
            .style
            ?.copyWith(
              backgroundColor: MaterialStateProperty.all(
                  color ?? Theme.of(context).colorScheme.primary),
              textStyle: MaterialStateProperty.all(
                TextStyle(
                    color:
                        textColor ?? Theme.of(context).colorScheme.onPrimary),
              ),
            )
            .merge(style),
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        child: DefaultTextStyle.merge(
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: textColor ?? Theme.of(context).colorScheme.onPrimary),
          child: child,
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final Widget child;

  final void Function()? onPressed;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  const SecondaryButton(
      {Key? key,
      required this.child,
      this.onPressed,
      this.height = kMinInteractiveDimension,
      this.color,
      this.width,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: Theme.of(context)
              .elevatedButtonTheme
              .style
              ?.copyWith(
                backgroundColor: MaterialStateProperty.all(
                    color ?? Theme.of(context).colorScheme.secondary),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                      color: textColor ??
                          Theme.of(context).colorScheme.onSecondary),
                ),
              )
              .merge(style),
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: DefaultTextStyle.merge(
            style: TextStyle(
                color: textColor ?? Theme.of(context).colorScheme.onSecondary),
            child: child,
          ),
        ));
  }
}

class OutlineButton extends StatelessWidget {
  final Widget child;

  final void Function()? onPressed;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  const OutlineButton(
      {Key? key,
      required this.child,
      this.onPressed,
      this.height = kMinInteractiveDimension,
      this.width,
      this.color,
      this.textColor,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
          onPressed: onPressed,
          style: Theme.of(context)
              .elevatedButtonTheme
              .style
              ?.copyWith(
                backgroundColor: MaterialStateProperty.all(
                    color ?? Theme.of(context).colorScheme.background),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                      color:
                          textColor ?? Theme.of(context).colorScheme.primary),
                ),
              )
              .merge(style),
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: DefaultTextStyle.merge(
            style: TextStyle(
                color: textColor ?? Theme.of(context).colorScheme.primary),
            child: child,
          )),
    );
  }
}

class TextsButton extends StatelessWidget {
  final Widget child;

  final void Function()? onPressed;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  const TextsButton(
      {Key? key,
      required this.child,
      this.onPressed,
      this.height = kMinInteractiveDimension,
      this.width,
      this.color,
      this.textColor,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: TextButton(
          onPressed: onPressed,
          style: Theme.of(context)
              .elevatedButtonTheme
              .style
              ?.copyWith(
                backgroundColor: MaterialStateProperty.all(
                    color ?? Theme.of(context).colorScheme.background),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                      color:
                          textColor ?? Theme.of(context).colorScheme.primary),
                ),
              )
              .merge(style),
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: DefaultTextStyle.merge(
            style: TextStyle(
                color: textColor ?? Theme.of(context).colorScheme.primary),
            child: child,
          ),
        ));
  }
}

const text = 'Find MassageX Service';
@WidgetbookUseCase(name: "primary", type: PrimaryButton)
Widget getButton(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: Center(
        child: PrimaryButton(
            onPressed: () {},
            height: 50,
            child: const Gordita(
              text: text,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            )),
      ),
    );

@WidgetbookUseCase(name: "secondary", type: SecondaryButton)
Widget getButton1(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: Center(
        child: SecondaryButton(
          height: 50,
          onPressed: () {},
          child: const Gordita(text: text),
        ),
      ),
    );

@WidgetbookUseCase(name: "outlined", type: OutlineButton)
Widget getButton2(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: Center(
        child: OutlineButton(
          height: 65,
          width: 72,
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: const BorderSide(),
                  borderRadius: BorderRadius.circular(8)))),
          onPressed: () {},
          child: const Gordita(text: "text"),
        ),
      ),
    );

@WidgetbookUseCase(name: "swipable", type: SwipableButton)
Widget getButton3(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: Center(
        child: SwipableButton(
          label: "Swipe to unlock",
          onUnlocked: () {
            //print("unlocked");
          },
        ),
      ),
    );

@WidgetbookUseCase(name: "Text", type: TextsButton)
Widget getButton4(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: Center(
        child: TextsButton(
          onPressed: () {},
          child: const Gordita(text: text),
        ),
      ),
    );
