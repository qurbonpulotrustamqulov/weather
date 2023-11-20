import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/pages/splash_two_page.dart';
import 'package:weather_app/services/constants/colors.dart';
import 'package:weather_app/services/constants/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void navigateToSplashTwoPage() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(
      const Duration(milliseconds: 2700),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const SplashTwoPage(),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    navigateToSplashTwoPage();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: CustomColors.$0C1823,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Animate(
            effects: const [
              FadeEffect(
                duration: Duration(seconds: 2),
                curve: Curves.easeInSine,
              ),
              ScaleEffect(
                duration: Duration(seconds: 2),
                curve: Curves.easeInSine,
              ),
            ],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.sp),
              child: const Image(image: CustomImages.imgLogo),
            ),
          ),
        ],
      ),
    );
  }
}
