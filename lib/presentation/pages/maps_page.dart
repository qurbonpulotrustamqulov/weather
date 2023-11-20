import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/domain/bloc/temperature_bloc/temperature_bloc.dart';
import 'package:weather_app/services/constants/colors.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late GoogleMapController mapController;

  void _fetchWeather(String countryName) {
    context.read<TemperatureBloc>().add(
          FetchWeatherEvent(
            countryName: countryName.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.$FFFFFF,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              /// #
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(13)),
                  border: Border.all(color: CustomColors.$36424D, width: 1.5),
                ),
                child: SizedBox(
                  height: 52,
                  child: TextField(
                    onSubmitted: _fetchWeather,
                    style: const TextStyle(color: CustomColors.$000000),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 40, top: 13.5),
                      hintText: 'Town or City',
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: CustomColors.$36424D,
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// #search icon
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Image(
                              image: AssetImage('assets/icons/ic_search.png'),
                            ),
                          ),
                          SizedBox(width: 30.sp),
                        ],
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// #google map
              BlocBuilder<TemperatureBloc, TemperatureState>(
                builder: (context, state) {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height* 0.58,
                    width: MediaQuery.sizeOf(context).width,

                    child: DecoratedBox(
                      decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: GoogleMap(

                          markers: {
                            Marker(
                            position: LatLng(
                              state.weatherModel.latitude,
                              state.weatherModel.longitude,
                            ),
                            markerId: MarkerId(state.weatherModel.currentWeatherModel.weatherCode.toString())
                          )},
                          onMapCreated: (controller) {
                            mapController = controller;
                            },
                          onCameraIdle: () {
                            mapController.animateCamera(
                                CameraUpdate.newCameraPosition(
                                    CameraPosition(target: LatLng(state.weatherModel.latitude,
                                      state.weatherModel.longitude,), zoom: 12)
                                  //17 is new zoom level
                                )
                            );
                          },
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              state.weatherModel.latitude,
                              state.weatherModel.longitude,
                            ),
                            zoom: 0.2,
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
