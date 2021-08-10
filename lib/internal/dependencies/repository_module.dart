import 'package:weather/data/repository/weather_data_repository.dart';
import 'package:weather/domain/repository/weather_repository.dart';
import 'package:weather/internal/dependencies/api_module.dart';

class RepositoryModule {
  static WeatherRepository _weatherRepository ;

  static WeatherRepository weatherRepository() {
    if(_weatherRepository == null){
      _weatherRepository = WeatherDataRepository(ApiModule.apiUtil());

    }
    return _weatherRepository ;
  }
}