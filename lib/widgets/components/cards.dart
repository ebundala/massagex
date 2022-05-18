import 'package:flutter/material.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class PrimaryCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool borderOnForeground;
  final EdgeInsetsGeometry? margin;
  final Clip? clipBehavior;
  final double borderRadius;
  final bool semanticContainer;

  const PrimaryCard(
      {Key? key,
      this.child,
      this.color,
      this.shadowColor,
      this.surfaceTintColor,
      this.elevation,
      this.shape,
      this.borderOnForeground = true,
      this.margin,
      this.clipBehavior,
      this.semanticContainer = true,
      this.borderRadius = 4.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: color,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        elevation: elevation ?? 0,
        shape: shape ??
            RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                ),
                borderRadius: BorderRadius.circular(borderRadius)),
        borderOnForeground: borderOnForeground,
        margin: margin,
        clipBehavior: clipBehavior,
        child: child);
  }
}

class CardWithActions extends StatelessWidget {
  final Widget? child;
  final List<Widget> actions;
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool borderOnForeground;
  final EdgeInsetsGeometry? margin;
  final Clip? clipBehavior;
  final double borderRadius;
  final bool semanticContainer;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment actionMainAxisAlignment;
  final MainAxisSize actionMainAxisSize;
  final CrossAxisAlignment actionCrossAxisAlignment;
  const CardWithActions({
    Key? key,
    this.child,
    this.actions = const [],
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground = true,
    this.margin,
    this.clipBehavior,
    this.borderRadius = 4,
    this.semanticContainer = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.actionMainAxisAlignment = MainAxisAlignment.start,
    this.actionMainAxisSize = MainAxisSize.max,
    this.actionCrossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
        color: color,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        elevation: elevation ?? 0,
        shape: shape,
        borderOnForeground: borderOnForeground,
        margin: margin,
        clipBehavior: clipBehavior,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: mainAxisSize,
            children: [
              if (child != null) Expanded(child: child!),
              const Divider(
                height: 1,
                color: Color.fromRGBO(0, 0, 0, 0.15),
              ),
              SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: actionMainAxisAlignment,
                    crossAxisAlignment: actionCrossAxisAlignment,
                    mainAxisSize: actionMainAxisSize,
                    children: actions,
                  ))
            ],
          ),
        ));
  }
}

@WidgetbookUseCase(name: "primary", type: PrimaryCard)
Widget getCard(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: PrimaryCard(
            elevation: 0,
            //color: Colors.red,
            child: SizedBox(
              height: 300,
              width: 300,
            ),
          ),
        ),
      ),
    );

@WidgetbookUseCase(name: "with actions", type: CardWithActions)
Widget getCard1(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: CardWithActions(
            actions: [Gordita(text: "action")],
            child: SizedBox(
              height: 300,
              width: 300,
            ),
          ),
        ),
      ),
    );
