
import 'package:flutter/foundation.dart';
import 'package:weather/data/api/service/weather_service.dart';
import 'package:weather/data/mapper/weather_mapper.dart';
import 'package:weather/domain/models/weather.dart';

class ApiUtil{
  final WeatherService _weatherService ;

  ApiUtil(this._weatherService);

  Future<List<Weather>> getWeather({@required String city}) async {
    final result = await _weatherService.getWeatherFromCity(city);

    List<Weather> weathers =  result.map<Weather>((apiWeather) => WeatherMapper.fromApi(apiWeather)).toList();

    return weathers ;
  }
}