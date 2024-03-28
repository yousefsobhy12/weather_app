import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_service_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/weather_service_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getAppTheme(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.weatherCondition,
              )),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getAppTheme(String? condition) {
  if (condition == null) {
    return Colors.yellow;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.yellow;
    case 'Partly cloudy':
      return Colors.blue;
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.lightBlue;
    case 'Patchy rain possible':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Light rain shower':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Light sleet':
    case 'Patchy light snow with thunder':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Heavy freezing drizzle':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Heavy snow':
    case 'Ice pellets':
      return Colors.lightGreen;
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Moderate or heavy rain':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.green;

    case 'Moderate or heavy snow':
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy snow showers':
    case 'Moderate or heavy sleet showers':
    case 'Moderate or heavy showers of ice pellets':
    case 'Moderate or heavy snow with thunder':
      return Colors.blueGrey;

    case 'Thundery outbreaks possible':
    case 'Patchy light snow showers':
      return Colors.orange;
    default:
      return Colors.grey;
  }
}
