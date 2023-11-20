import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/domain/bloc/page_controller_bloc/page_controller_bloc.dart';
import 'package:weather_app/domain/bloc/temperature_bloc/temperature_bloc.dart';
import 'package:weather_app/presentation/pages/main_page.dart';
import 'package:weather_app/presentation/pages/splash_page.dart';
import 'package:weather_app/services/constants/styles.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => TemperatureBloc()),
            BlocProvider(create: (context) => PageControllerBloc()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: CustomStyles.poppins,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              useMaterial3: true,
            ),
            home: child,
          ),
        );
      },
      child: const SplashPage(),
    );
  }
}
