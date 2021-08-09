import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/internal/dependencies/repository_module.dart';

import 'package:weather/presentation/screens/main/screen.dart';

import 'data/blocs/theme_bloc/theme_bloc.dart';
import 'data/blocs/weather_bloc/weather_bloc.dart';
import 'data/blocs/weather_bloc/weather_bloc_observer.dart';
import 'domain/repository/weather_repository.dart';



void main() {
  Bloc.observer = WeatherBlocObserver();
  final WeatherRepository weatherRepository = RepositoryModule.weatherRepository();
  runApp(
    BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc() ,
        child: MyApp(weatherRepository: weatherRepository,))
  );
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository ;
  MyApp({Key key , @required this.weatherRepository}):
      assert(weatherRepository != null), super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
        )
    );
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // onGenerateRoute: _routes.createRoute,

      home: BlocProvider(
          create: (context) => WeatherBloc(weatherRepository: weatherRepository),
          child: MainScreen()),
    );
  }
// void dispose(){
//   _routes.dispose();
// }
}