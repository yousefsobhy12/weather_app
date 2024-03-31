import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_service_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            getAppTheme(weatherModel.weatherCondition),
            getAppTheme(weatherModel.weatherCondition)[300]!,
            getAppTheme(weatherModel.weatherCondition)[50]!
          ])),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: "bebasNeue"),
            ),
            Text(
              'Updated time: ${weatherModel.updatedDate.hour}:${weatherModel.updatedDate.minute}',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "bebasNeue"),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weatherModel.image!}',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    weatherModel.avgTemp.toInt().toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFamily: "bebasNeue"),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.maxTemp.toInt().toString()}',
                      style: const TextStyle(
                          fontSize: 20, fontFamily: "bebasNeue"),
                    ),
                    Text(
                      'Mintemp: ${weatherModel.minTemp.toInt().toString()}',
                      style: const TextStyle(
                          fontSize: 20, fontFamily: "bebasNeue"),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  fontFamily: "bebasNeue"),
            ),
          ],
        ),
      ),
    );
  }
}
