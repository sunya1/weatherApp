import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/blocs/theme_bloc/theme_bloc.dart';
import 'package:weather/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather/blocs/weather_bloc/weather_bloc_observer.dart';
import 'package:weather/repository/weather_repository.dart';
import 'package:weather/screens/home/screen.dart';
import 'package:weather/screens/main/screen.dart';


void main() {
  Bloc.observer = WeatherBlocObserver();
  final WeatherRepository weatherRepository = WeatherRepository(
    httpClient: http.Client()
  );
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
          //color set to transperent or set your own color
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