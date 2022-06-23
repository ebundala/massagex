import 'package:flutter/material.dart';
import 'package:massagex/widgets/components/swipable_button/button_slider_thumb_shape.dart';
import 'package:massagex/widgets/components/swipable_button/track.dart';

class SwipableButton extends StatefulWidget {
  const SwipableButton(
      {Key? key, required this.onUnlocked, required this.label})
      : super(key: key);
  final VoidCallback? onUnlocked;
  final String label;
  @override
  State<SwipableButton> createState() => _SwipableButtonState();
}

class _SwipableButtonState extends State<SwipableButton>
    with TickerProviderStateMixin {
  var _value = 0.0;
  late AnimationController _animationController;
  late CurvedAnimation _animation;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        value: _value,
        vsync: this,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 1));

    _animation = CurvedAnimation(
        parent: _animationController.view,
        curve: Curves.linear,
        reverseCurve: Curves.ease)
      ..addListener(() {
        setState(() {
          _value = _animation.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 50,
        activeTrackColor: Theme.of(context).colorScheme.primary,
        trackShape: ButtonSliderTrackShape(
          label: widget.label,
        ),
        thumbColor: Theme.of(context).colorScheme.onPrimary,
        thumbShape: const ButtonSliderThumbShape(height: 50),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
      ),
      child: Slider(
          value: widget.onUnlocked == null ? 0.0 : _value,
          onChangeEnd: (v) {
            if (v == 1) {
              widget.onUnlocked?.call();
            } else {
              if (!_animationController.isAnimating) {
                _animationController.reverse(from: v);
              }
            }
          },
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          }),
    );
  }
}
