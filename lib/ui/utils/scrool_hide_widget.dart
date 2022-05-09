import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;

  const ScrollHideWidget(
      {Key? key,
        required this.child,
        required this.controller,
        this.duration = const Duration(milliseconds: 200)})
      : super(key: key);

  @override
  State<ScrollHideWidget> createState() => _ScrollHideWidgetState();
}

class _ScrollHideWidgetState extends State<ScrollHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listenScroll);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listenScroll);
    super.dispose();
  }

  void listenScroll() {
    final position = widget.controller.position;
    final direction = position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      setState(() {
        isVisible = true;
      });
    } else if (direction == ScrollDirection.reverse && position.pixels >= 350) {
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? kBottomNavigationBarHeight : 0,
      child: Wrap(children: [widget.child]),
    );
  }
}
