import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/blocs/theme_bloc/theme_bloc.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/resources/icons.dart';

class WeatherItem extends StatelessWidget {
  final Weather weather;
  final int index ;

  WeatherItem(this.weather , this.index);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(9, 50, 9, 0),
          child: Column(
            children: [
              Text(weather.created.substring(5 , 10)),
              IconButton(icon: state.icon[index], onPressed: () {}),
              Text('${weather.temp.toInt().toString()}°'),
            ],
          ),
        );
      },
    );
  }

}