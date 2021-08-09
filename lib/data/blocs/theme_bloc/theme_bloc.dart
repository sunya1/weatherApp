import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta/meta.dart';
import 'package:weather/data/api/model/api_weather.dart';
import 'package:weather/domain/models/weather.dart';

import 'package:weather/presentation/utils/icons.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  ThemeBloc() : super(ThemeState());

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    // TODO: implement mapEventToState
    ThemeState newThemeState ;
    List<Widget> icons = new List();
    if(event is ThemeEventWeatherChanged){
      final weathers = event.weathers ;
      for(var i = 0 ; i < weathers.length ; i++){
        final weatherCondition = weathers[i].weatherCondition;
        if(weatherCondition == WeatherCondition.sleet ||
            weatherCondition == WeatherCondition.lightRain ||
            weatherCondition == WeatherCondition.heavyRain ||
            weatherCondition == WeatherCondition.showers){

          icons.add(SvgPicture.asset(CustomIcons.rainy));
        }
        else if(weatherCondition == WeatherCondition.lightCloud ||
            weatherCondition == WeatherCondition.heavyCloud){

          icons.add(SvgPicture.asset(CustomIcons.cloudy));
        }
        else if(weatherCondition == WeatherCondition.hail ||
            weatherCondition == WeatherCondition.snow) icons.add(SvgPicture.asset(CustomIcons.snow));

        else if(weatherCondition == WeatherCondition.clear) icons.add(SvgPicture.asset(CustomIcons.sunny));

        else if(weatherCondition == WeatherCondition.thunderStorm) icons.add(SvgPicture.asset(CustomIcons.thunder));

        else icons.add(SvgPicture.asset(CustomIcons.sunny));
      }


          yield ThemeState(icon: icons) ;
    }

  }
}
