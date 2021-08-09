import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:weather/data/api/model/api_weather.dart';

class WeatherService{
  static const _BASE_URL = 'https://www.metaweather.com' ;
  // final locationUrl = (city) =>'${baseUrl}/api/location/search/?query=${city}' ;
  // final weatherUrl = (locationId) => '${baseUrl}/api/location/${locationId}' ;

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL)
  );

  Future<List<ApiWeather>> fetchWeather({@required locationId}) async {
    final response = await _dio.get('/api/location/{$locationId}');

    final weatherJson = response.data ;

    final city = weatherJson['title'] as String ;
    final parsed = weatherJson['consolidated_weather'].cast<Map<String , dynamic>>() ;

    List<ApiWeather> weathers =  parsed.map<ApiWeather>((json) => ApiWeather.fromJson(json , city)).toList();

    return weathers ;

  }

  Future<int> getLocationId(String city) async {
    final query = {'query': city} ;
    final response = await _dio.get('/api/location/search' , queryParameters: query);

    if(response.statusCode == 200){
      final cities = jsonDecode(response.data) as List ;
      return (cities.first)['woeid'] ?? 0 ;
    }
    else{
      throw Exception("We can not get location id of ${city}");
    }
  }

  Future<List<ApiWeather>> getWeatherFromCity(String city) async {
    final int locationId = await getLocationId(city);

    return fetchWeather(locationId: locationId );
  }
}