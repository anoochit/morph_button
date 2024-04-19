import 'package:flutter/material.dart';

/// A custom button widget that animates its shape and color on press,
/// providing a visually appealing user interaction.
class MorphButton extends StatefulWidget {
  /// Creates a new MorphButton.
  const MorphButton(
      {super.key,

      /// The text displayed on the button.
      required this.title,

      /// The callback function called when the button is tapped.
      required this.onTap,

      /// The color of the button when pressed.
      required this.pressedColor,

      /// The initial color of the button before pressing.
      required this.initialColor,

      /// The initial radius of the button's corners.
      required this.initialRadius,

      /// The width of the button.
      required this.width,

      /// The height of the button.
      required this.height});

  final Widget title;
  final VoidCallback onTap;
  final Color pressedColor;
  final Color initialColor;
  final double initialRadius;
  final double width;
  final double height;

  @override
  State<MorphButton> createState() => _MorphButtonState();
}

class _MorphButtonState extends State<MorphButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shapeAnimation;
  final Duration _animationDuration = const Duration(milliseconds: 250);

  /// Initializes the animation controller used for morphing the button's appearance.
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: _animationDuration);
    _shapeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller)
      ..addListener(
        () => setState(
          () {},
        ),
      );
  }

  /// Releases the resources used by the animation controller when the widget is disposed.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Triggers the button's morph animation and executes the user-defined onTap callback.
  void _toggleButtonState() {
    setState(() {
      _controller.forward();
      Future.delayed(const Duration(milliseconds: 250)).then((value) {
        _controller.reverse();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// Listens for taps on the button and triggers the _toggleButtonState method.
      onTap: () {
        _toggleButtonState();
        widget.onTap();
      },
      child: AnimatedContainer(
        /// Animates the button's appearance over the course of the specified duration.
        duration: _animationDuration,

        /// Defines the easing curve for the animation, controlling its speed and smoothness.
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          /// Sets the button's color based on the animation progress.
          /// When the animation value is less than 0.5 (meaning the first half of the animation),
          /// the color is set to the initialColor. Otherwise, it transitions to the pressedColor.
          color: (_shapeAnimation.value < 0.5)
              ? widget.initialColor
              : widget.pressedColor,

          /// Sets the button's corner radius based on the animation progress.
          /// Similar to the color, the radius transitions between the initialRadius and half of the button's width
          /// depending on the animation value.
          borderRadius: BorderRadius.circular(
            (_shapeAnimation.value < 0.5)
                ? widget.initialRadius
                : widget.width * 0.5,
          ),
        ),
        width: widget.width,
        height: widget.height,
        child: Center(
          child: widget.title,
        ),
      ),
    );
  }
}
