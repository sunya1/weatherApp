import 'package:weather/data/api/model/api_weather.dart';
import 'package:weather/domain/models/weather.dart';

class WeatherMapper {
  static Weather fromApi(ApiWeather weather){
    return Weather(
        weatherCondition: weather.weatherCondition,
        formattedCondition: weather.formattedCondition  ,
        created: weather.created,
        minTemp: weather.minTemp,
        maxTemp: weather.maxTemp ,
        temp: weather.temp,
        windSpeed: weather.windSpeed,
        airPressure: weather.airPressure,
        humidity: weather.humidity,
        lastUpdated: weather.lastUpdated,
        location: weather.location
    );
  }
}

// weather.weatherCondition,
// weather.formattedCondition ,
// weather.created,
// weather.minTemp,
// weather.maxTemp ,
// weather.temp,
// weather.windSpeed,
// weather.airPressure,
// weather.humidity,
// weather.lastUpdated,
// weather.location