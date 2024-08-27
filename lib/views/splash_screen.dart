import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fakestoreapi/router.dart';
import 'package:fakestoreapi/theme/light_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  data() async {
    var marketBox = Hive.box('market');
    if (settingsController.cart?.isEmpty == true) {
      await marketBox.delete('market');
    }
  }

  @override
  void initState() {
    super.initState();
    settingsController.addListener(() {
      if (mounted) {
        settingsController.loadSettings();
        setState(() {});
      }
    });
    data();
    Future.delayed(const Duration(milliseconds: 4000), () {
      context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: LightTheme.background,
        ),
        child: Stack(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/img/splash/top.png',
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/img/splash/bottom.png',
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/img/splash/logo.png',
              width: LightTheme.mediaQueryData.size.width * 0.5,
            ),
          ),
        ]),
      ),
    );
  }
}
