import 'package:flutter/material.dart';

class AnimatedBalloonWidget extends StatefulWidget {
  const AnimatedBalloonWidget({Key? key}) : super(key: key);

  @override
  AnimatedBalloonWidgetState createState() => AnimatedBalloonWidgetState();
}

class AnimatedBalloonWidgetState extends State<AnimatedBalloonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Animation<double> _animationFloatUp;
  // Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    double _balloonHeight = MediaQuery.of(context).size.height / 2;
    double _balloonWidth = MediaQuery.of(context).size.width / 3;
    double _balloonBottomLocation =
        MediaQuery.of(context).size.height - _balloonHeight;

    var _animationFloatUp =
        Tween(begin: _balloonBottomLocation, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    var _animationGrowSize = Tween(begin: 50.0, end: _balloonWidth).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.elasticInOut),
      ),
    );
    _controller.forward();

    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(
            top: _animationFloatUp.value,
          ),
          width: _animationGrowSize.value,
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Image.asset(
          "assets/images/BeginningGoogleFlutter-Balloon.png",
          height: _balloonHeight,
          width: _balloonWidth,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
