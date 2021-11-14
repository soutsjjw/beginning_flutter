import 'package:ch7_animations/widgets/animated_container.dart';
import 'package:ch7_animations/widgets/animated_cross_fad.dart';
import 'package:ch7_animations/widgets/animated_opacity.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animations"),
      ),
      body: SafeArea(
        child: Column(
          children: const [
            AnimatedContainerWidget(),
            Divider(),
            AnimatedCrossFadeWidget(),
            Divider(),
            AnimatedOpacityWidget(),
          ],
        ),
      ),
    );
  }
}
