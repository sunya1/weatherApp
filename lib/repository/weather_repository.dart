//https://www.metaweather.com/api/location/search/?query=Chicago
//https://www.metaweather.com/api/location/2379574

import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather.dart';


const baseUrl = 'https://www.metaweather.com' ;
final locationUrl = (city) =>'${baseUrl}/api/location/search/?query=${city}' ;
final weatherUrl = (locationId) => '${baseUrl}/api/location/${locationId}' ;

class WeatherRepository {

  final http.Client httpClient ;
  WeatherRepository({@required this.httpClient}): assert(httpClient != null);

  Future<int> getLocationId(String city) async {
    final response = await this.httpClient.get(Uri.parse(locationUrl(city)));

    if(response.statusCode == 200){
      final cities = jsonDecode(response.body) as List ;
      return (cities.first)['woeid'] ?? 0 ;
    }
    else{
      throw Exception("We can not get location id of ${city}");
    }
  }
  Future<List<Weather>> fetchWeather(int locationId ) async {
    final response = await this.httpClient.get(Uri.parse(weatherUrl(locationId)));

    if(response.statusCode != 200) throw Exception("Error getting weather from locationId : ${locationId}");

    final weatherJson = jsonDecode(response.body);

    return parseWeathers(weatherJson) ;
  }
  List<Weather> parseWeathers(dynamic weatherJson)   {
    final city = weatherJson['title'] as String ;
    final parsed = weatherJson['consolidated_weather'].cast<Map<String , dynamic>>() ;

    List<Weather> weathers =  parsed.map<Weather>((json) => Weather.fromJson(json , city)).toList();

    return weathers ;
  }
    Future<List<Weather>> getWeatherFromCity(String city) async {
      final int locationId = await getLocationId(city);

      return fetchWeather(locationId );
    }

}
