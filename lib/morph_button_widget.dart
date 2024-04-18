import 'package:flutter/material.dart';

class MorphButton extends StatefulWidget {
  const MorphButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.pressedColor,
      required this.initialColor,
      required this.initialRadius,
      required this.width,
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
  final Duration _animationDuration = const Duration(milliseconds: 300);

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleButtonState() {
    setState(() {
      _controller.forward();
      Future.delayed(const Duration(milliseconds: 400)).then((value) {
        _controller.reverse();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _toggleButtonState();
        widget.onTap();
      },
      child: AnimatedContainer(
        duration: _animationDuration,
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: (_shapeAnimation.value < 0.5)
              ? widget.initialColor
              : widget.pressedColor,
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
