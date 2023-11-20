import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/services/constants/colors.dart';
import 'package:weather_app/services/constants/strings.dart';

String mood = CustomStrings.veryGood;

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  int selectedItem = 1;

  List<String> moods = [
    CustomStrings.veryGoodEmoji,
    CustomStrings.okish,
    CustomStrings.veryBad,
    CustomStrings.angry,
    CustomStrings.justSadForNoReason,
    CustomStrings.iAmVeryVeryHappy
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.$FFFFFF,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 42.sp),

                /// #header text
                Text(
                  CustomStrings.howYouFeelToday,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                    color: CustomColors.$09151E,
                  ),
                ),
                SizedBox(height: 22.sp),

                /// #all moods
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.sp),
                  child: Wrap(
                    children: [
                      for (int i = 0; i < moods.length; i++)
                        Padding(
                          padding: EdgeInsets.only(right: 10.sp, bottom: 10.sp),
                          child: GestureDetector(
                            onTap: () {
                              selectedItem = i;
                              mood = moods[i];
                              setState(() {});
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: selectedItem == i
                                    ? CustomColors.$36424D
                                    : null,
                                border: selectedItem == i
                                    ? null
                                    : Border.all(color: CustomColors.$36424D),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.sp)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 19.sp,
                                  vertical: 28.sp,
                                ),
                                child: Text(
                                  moods[i],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: selectedItem == i
                                        ? CustomColors.$FCFCFC
                                        : CustomColors.$36424D,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      // MoodWidgets(selectedItem: selectedItem, mood: moods[i], index: i,)
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 45),

            /// #mood
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 130.sp,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          CustomStrings.todayMood,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: CustomColors.$36424D,
                          ),
                        ),
                        SizedBox(height: 5.sp),
                        Text(
                          mood,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: CustomColors.$0C1823,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 33.sp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        CustomStrings.tomorrowMood,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: CustomColors.$36424D,
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Text(
                        CustomStrings.excellent,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: CustomColors.$0C1823,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
