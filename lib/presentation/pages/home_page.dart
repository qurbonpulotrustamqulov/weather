import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/domain/bloc/temperature_bloc/temperature_bloc.dart';
import 'package:weather_app/presentation/pages/mood_page.dart';
import 'package:weather_app/services/constants/colors.dart';
import 'package:weather_app/services/constants/icons.dart';
import 'package:weather_app/services/constants/images.dart';
import 'package:weather_app/services/constants/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: CustomColors.$FFFFFF,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// #header text
                Text(
                  CustomStrings.feelsLikeAGoodTimeToRideABike,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.$09151E,
                  ),
                ),
                SizedBox(width: 20.sp),

                /// #icon bike
                Image(
                  image: CustomIcons.icBike,
                  width: 30.sp,
                )
              ],
            ),
          ),
          const SizedBox(height: 60),

          /// #
          SizedBox(
            height: 265.sp,
            width: 265.sp,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 264.sp,
                    width: 264.sp,
                    decoration: const BoxDecoration(
                      color: CustomColors.$0C1823,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.9.sp, -0.6.sp),
                  child: Image(
                    image: CustomImages.imgCloudTopLeft,
                    width: 65.sp,
                  ),
                ),
                Align(
                  alignment: Alignment(0.9.sp, -0.55.sp),
                  child: Image(
                    image: CustomImages.imgCloudTopRight,
                    width: 55.sp,
                  ),
                ),
                Align(
                  alignment: Alignment(0.9.sp, 0.7.sp),
                  child: Image(
                    image: CustomImages.imgCloudBottomRight,
                    width: 65.sp,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.9.sp, 0.6.sp),
                  child: Image(
                    image: CustomImages.imgCloudBottomLeft,
                    width: 70.sp,
                  ),
                ),
                Align(
                  alignment: Alignment(0.sp, 1.1.sp),
                  child: Image(
                    image: CustomImages.imgCloudBottom,
                    width: 65.sp,
                  ),
                ),
                Align(
                  alignment: Alignment(0.25.sp, 0.3.sp),
                  child: Image(
                    image: CustomImages.imgCloudCenter,
                    width: 85.sp,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.10.sp, -0.15.sp),
                  child: BlocBuilder<TemperatureBloc, TemperatureState>(
                    builder: (context, state) {
                      return Text(
                        '${state.weatherModel.currentWeatherModel.temperature}°',
                        style: TextStyle(
                          fontSize: 38.sp,
                          color: CustomColors.$FFFFFF,
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment(-0.25.sp, -0.35.sp),
                  child: Text(
                    CustomStrings.todayLike,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: CustomColors.$FFFFFF,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 60.sp),

          /// #
          SizedBox(
            width: 350.sp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// #
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// #
                    Text(
                      CustomStrings.todayMood,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: CustomColors.$000000,
                      ),
                    ),

                    /// #
                    Text(
                      mood,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.$000000,
                      ),
                    ),
                  ],
                ),

                /// #
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// #
                    Text(
                      CustomStrings.tomorrowMood,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: CustomColors.$000000,
                      ),
                    ),

                    /// #
                    Text(
                      CustomStrings.excellent,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.$000000,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
