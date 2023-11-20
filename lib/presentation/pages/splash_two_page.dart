import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/pages/main_page.dart';
import 'package:weather_app/services/constants/colors.dart';
import 'package:weather_app/services/constants/images.dart';
import 'package:weather_app/services/constants/strings.dart';

class SplashTwoPage extends StatelessWidget {
  const SplashTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    void navigateToHomePage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: CustomColors.$FFFFFF,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// #top right star
          Align(
            alignment: Alignment.topRight,
            child: Transform.scale(
              scale: 1.2,
              child: Image(
                image: CustomImages.imgBlueStar,
                width: 110.sp,
                height: 110.sp,
              ),
            ),
          ),
          const Spacer(),

          /// #main text
          Text(
            CustomStrings.letsSeeTheWeatherAroundYou,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 42.sp,
              color: CustomColors.$000000,
            ),
          ),
          const Spacer(),

          /// #navigator to home page
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(290.sp, 50.sp),
              maximumSize: Size(290.sp, 50.sp),
              shadowColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              backgroundColor: CustomColors.$0C1823,
            ),
            onPressed: navigateToHomePage,
            child: Text(
              CustomStrings.letsCheck,
              style: TextStyle(
                fontSize: 18.sp,
                color: CustomColors.$FFFFFF,
              ),
            ),
          ),
          SizedBox(height: 60.sp)
        ],
      ),
    );
  }
}
