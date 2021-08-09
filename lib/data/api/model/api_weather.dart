import 'package:equatable/equatable.dart';

class ApiWeather  {
  final WeatherCondition weatherCondition ;
  final String formattedCondition ;
  final String created ;
  final double minTemp ;
  final double maxTemp ;
  final double temp ;
  final double windSpeed ;
  final double airPressure ;
  final int humidity ;
  final DateTime lastUpdated ;
  final String location ;



  ApiWeather.fromJson( dynamic consolidatedWeather, String city  ) :
        weatherCondition = _mapStringToWeatherCondition(consolidatedWeather['weather_state_abbr'])  ?? '',
        formattedCondition = consolidatedWeather['weather_state_abbr'] ?? '' ,
        created = consolidatedWeather['applicable_date'] ?? '',
        minTemp = consolidatedWeather['min_temp']  as double ?? 0.0,
        maxTemp = consolidatedWeather['max_temp'] as double ?? 0.0 ,
        temp = consolidatedWeather['the_temp'] as double ?? 0.0,
        windSpeed = consolidatedWeather['wind_speed'] as double ?? 0.0,
        airPressure = consolidatedWeather['air_pressure'] as double ?? 1000 ,
        humidity = consolidatedWeather['humidity'] as int ?? 0,
        lastUpdated = DateTime.now(),
        location = city ;

  static WeatherCondition _mapStringToWeatherCondition(String formattedCondition){
    Map<String , WeatherCondition> map = {
      'sn': WeatherCondition.snow,
      'sl': WeatherCondition.sleet ,
      'h' : WeatherCondition.hail,
      't' : WeatherCondition.thunderStorm,
      'hr': WeatherCondition.heavyRain,
      's' : WeatherCondition.showers,
      'lr': WeatherCondition.lightRain,
      'hc': WeatherCondition.heavyCloud,
      'lc': WeatherCondition.lightCloud,
      'c' : WeatherCondition.clear
    };
    return map[formattedCondition] ?? WeatherCondition.unknown ;
  }

}

// "id": 6594867707772928,
// "weather_state_name": "Heavy Rain",
// "weather_state_abbr": "hr",
// "wind_direction_compass": "SSW",
// "created": "2021-06-20T06:36:20.135483Z",
// "applicable_date": "2021-06-20",
// "min_temp": 19.205,
// "max_temp": 27.545,
// "the_temp": 29.255000000000003,
// "wind_speed": 5.611883207425965,
// "wind_direction": 197.2433967884918,
// "air_pressure": 1005,
// "humidity": 62,
// "visibility": 13.155670882048835,
// "predictability": 77

enum WeatherCondition{
  snow,
  lightRain,
  heavyRain,
  sleet,
  thunderStorm,
  showers,
  lightCloud,
  heavyCloud,
  clear,
  hail,
  unknown
}