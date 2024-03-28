import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'de3ae07d350b4681a02212809241703';
  WeatherServices(this.dio);

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          "Oops, there's an error. Please try again later.";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Oops, there's an error. Please try again later.");
    }
  }
}

//Api link ⬇️
//https://api.weatherapi.com/v1/forecast.json?key=de3ae07d350b4681a02212809241703&q=Cairo&days=1