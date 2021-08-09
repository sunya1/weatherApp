import 'package:weather/data/api/api_util.dart';
import 'package:weather/data/api/service/weather_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;

  static ApiUtil apiUtil(){
    if(_apiUtil == null) {
      _apiUtil = ApiUtil(WeatherService());
    }
    return _apiUtil ; 
  }
}