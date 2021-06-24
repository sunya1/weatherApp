import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository ;
  WeatherBloc({@required this.weatherRepository}):
        assert(weatherRepository != null),
        super(WeatherStateInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if(event is WeatherEventRequested){
      yield WeatherStateLoading();

      try{

        final List<Weather> weathers = await weatherRepository.getWeatherFromCity(event.city);


        yield WeatherStateSuccess(weathers: weathers);
      }
      catch(exception){
        print(exception.toString());
        yield WeatherStateFailure();
      }
    }
    else if(event is WeatherEventRefresh){
      yield WeatherStateLoading();

      try{

        final List<Weather> weathers = await weatherRepository.getWeatherFromCity(event.city );

        yield WeatherStateSuccess(weathers: weathers);
      }
      catch(exception){
        yield WeatherStateFailure();
      }
    }
  }
}
