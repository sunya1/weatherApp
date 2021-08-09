

import 'package:weather/data/api/model/api_weather.dart';

class Weather {
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


  const Weather({
    this.weatherCondition,
    this.formattedCondition,
    this.created,
    this.minTemp,
    this.maxTemp,
    this.temp,
    this.windSpeed,
    this.airPressure,
    this.humidity,
    this.lastUpdated,
    this.location
  });


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




