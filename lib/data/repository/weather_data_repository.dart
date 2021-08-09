import 'package:weather/data/api/api_util.dart';
import 'package:weather/domain/models/weather.dart';
import 'package:weather/domain/repository/weather_repository.dart';

class WeatherDataRepository extends WeatherRepository{
  final ApiUtil _apiUtil ;

  WeatherDataRepository(this._apiUtil);
  @override
  Future<List<Weather>> getWeather({String city}) {
    return _apiUtil.getWeather(city: city);
  }
}