import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class DemoRiveScreen extends StatefulWidget {
  const DemoRiveScreen({super.key});

  @override
  State<DemoRiveScreen> createState() => _DemoRiveScreenState();
}

class _DemoRiveScreenState extends State<DemoRiveScreen> {
  Artboard? riveArtboard;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rootBundle.load("assets/rive/demo.rive").then((data) async {
      try {
        final file = RiveFile.import(data);
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: RiveAnimation.asset("assets/rive/demo.riv"),
        ),
      ),
    );
  }
}
