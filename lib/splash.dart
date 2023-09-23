import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Duration duration;
  final Widget navigateAfterDuration;

  SplashScreen({
    required this.duration,
    required this.navigateAfterDuration,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(widget.duration);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => widget.navigateAfterDuration,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Place designn.png at the topmost
          Positioned.fill(
            top: 0.0,
            child: Image.asset(
              'assets/designn.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Place IdeaProtect.gif at the center
          Positioned.fill(
            child: Center(
              child: Image.asset(
                'assets/logo.gif',
                width: 200, // Set your preferred width
              ),
            ),
          ),
          // Place design.png at the bottommost
          Positioned.fill(
            bottom: 0.0,
            child: Image.asset(
              'assets/design.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
