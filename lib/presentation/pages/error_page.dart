import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather_app/services/constants/colors.dart';
import 'package:weather_app/services/constants/images.dart';
import 'package:weather_app/services/constants/strings.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 50),
          const Image(image: CustomImages.imgNotFound, fit: BoxFit.cover),
          const Text(
            CustomStrings.opsNothingHere,
            style: TextStyle(
              fontFamily: "",
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: CustomColors.$000000,
            ),
          ),
          Animate(
            effects: const [
              // SlideEffect(begin: Offset(1,1), end: Offset(0, 0), duration: Duration(milliseconds: 750)),
              ScaleEffect(
                  duration: Duration(seconds: 1), curve: Curves.bounceOut),
            ],
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.$0C1823,
                minimumSize: const Size(334, 62),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              onPressed: () {},
              child: const Text(
                CustomStrings.letGoHome,
                style: TextStyle(
                  fontFamily: "",
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: CustomColors.$FCFCFC,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
