import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({Key? key}) : super(key: key);

  @override
  _AnimatedCrossFadeWidgetState createState() => _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _crossFadStateShowFirst = true;

  void _crossFade() {
    setState(() {
      _crossFadStateShowFirst = !_crossFadStateShowFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              sizeCurve: Curves.bounceOut,
              crossFadeState: _crossFadStateShowFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Container(
                color: Colors.amber,
                height: 100.0,
                width: 100.0,
              ),
              secondChild: Container(
                color: Colors.lime,
                height: 200.0,
                width: 200.0,
              ),
            ),
            Positioned.fill(
              child: FlatButton(
                child: const Text("Tap to\nFade Color & Size"),
                onPressed: () {
                  _crossFade();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
