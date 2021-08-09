import 'package:flutter/foundation.dart';
import 'package:weather/domain/models/weather.dart';

abstract class WeatherRepository {
  Future<List<Weather>> getWeather({@required String city});
}
