// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/domain/bloc/page_controller_bloc/page_controller_bloc.dart';
import 'package:weather_app/domain/bloc/temperature_bloc/temperature_bloc.dart';
import 'package:weather_app/presentation/pages/home_page.dart';
import 'package:weather_app/presentation/pages/maps_page.dart';
import 'package:weather_app/presentation/pages/mood_page.dart';
import 'package:weather_app/services/constants/colors.dart';
import 'package:weather_app/services/constants/icons.dart';

bool toggle = true;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PageController controller;

  void _changePage(int index) =>
      BlocProvider.of<PageControllerBloc>(context).add(
        ChangePageEvent(index: index),
      );

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenUtil.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.$FFFFFF,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 140,
        leading: Row(
          children: [
            SizedBox(width: 30),

            /// #current location
            BlocBuilder<TemperatureBloc, TemperatureState>(
              builder: (context, state) {
                return Text(
                  (state is FetchWeatherSuccessState)
                      ? state.locationModel.name
                      : 'Tashkent',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: CustomColors.$36424D,
                  ),
                );
              },
            ),
          ],
        ),
        actions: const [
          Image(
            image: CustomIcons.icDrawer,
            width: 35,
            height: 35,
          ),
          SizedBox(width: 30),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: _changePage,
        children: const [
          HomePage(),
          MoodPage(),
          MapsPage(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35, bottom: 35),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 65,
          child: Row(
            children: [
              BlocBuilder<PageControllerBloc, PageControllerState>(
                builder: (context, state) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _changePage(0);
                        controller.jumpToPage(0);
                      },
                      child: SizedBox(
                        height: 65,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: state.currentIndex == 0
                                ? CustomColors.$0C1823
                                : null,
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: state.currentIndex == 0
                                ? Image(
                                    image: CustomIcons.icSunWhite,
                                    width: 32,
                                    height: 32,
                                  )
                                : Image(
                                    image: CustomIcons.icSunBlack,
                                    width: 32,
                                    height: 32,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<PageControllerBloc, PageControllerState>(
                builder: (context, state) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _changePage(1);
                        controller.jumpToPage(1);
                      },
                      child: SizedBox(
                        height: 65,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: state.currentIndex == 1
                                ? CustomColors.$0C1823
                                : null,
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: state.currentIndex == 1
                                ? Image(
                                    image: CustomIcons.icCloudWhite,
                                    width: 32,
                                    height: 32,
                                  )
                                : Image(
                                    image: CustomIcons.icCloudBlack,
                                    width: 32,
                                    height: 32,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<PageControllerBloc, PageControllerState>(
                builder: (context, state) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _changePage(2);
                        controller.jumpToPage(2);
                      },
                      child: SizedBox(
                        height: 65,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: state.currentIndex == 2
                                ? CustomColors.$0C1823
                                : null,
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: state.currentIndex == 2
                                ? Image(
                                    image: CustomIcons.icLocationWhite,
                                    width: 32,
                                    height: 32,
                                  )
                                : Image(
                                    image: CustomIcons.icLocationBlack,
                                    width: 32,
                                    height: 32,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
