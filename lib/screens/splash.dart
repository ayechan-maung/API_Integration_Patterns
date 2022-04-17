import 'package:flutter/material.dart';
import 'package:flutter_patterns/src/ui/mv_with_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return MvWithBloc();
      }), (route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: Text('PATTERNS')),
    );
  }
}
