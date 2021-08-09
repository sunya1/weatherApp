import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/data/blocs/theme_bloc/theme_bloc.dart';
import 'package:weather/data/blocs/weather_bloc/weather_bloc.dart';


import 'package:weather/presentation/widgets/details.dart';
import 'package:weather/presentation/widgets/app_bar_widget.dart';
import 'package:weather/presentation/utils/icons.dart';
import 'package:weather/presentation/utils/variables.dart';
import 'package:weather/presentation/utils/color_theme.dart';
import 'package:weather/presentation/utils/text_theme.dart';
import 'package:weather/presentation/widgets/weathers_list_view.dart';

class MainScreen extends StatefulWidget {




  @override
  _MainScreenState createState() => _MainScreenState();
}

  class _MainScreenState extends State<MainScreen> {
    Completer<void> _completer = Completer<void>();
    final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.main_color,
      resizeToAvoidBottomInset: false,
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<WeatherBloc , WeatherState>(
            listener: (context , weatherState){
              if(weatherState is WeatherStateSuccess){
                BlocProvider.of<ThemeBloc>(context).add(ThemeEventWeatherChanged(weathers: weatherState.weathers));
                _completer?.complete();
                _completer = Completer();
              }

            },
            builder:(context , weatherState){
              if(weatherState is WeatherStateInitial){
                BlocProvider.of<WeatherBloc>(context).add(WeatherEventRequested(city: "Tokyo"));
              }
              if(weatherState is WeatherStateLoading)
                return Center(child: CircularProgressIndicator(),);
              if(weatherState is WeatherStateSuccess) {
                final weather = weatherState.weathers[0] ;
                return BlocBuilder<ThemeBloc , ThemeState>(
                    builder: (context , themeState){
                      return RefreshIndicator(
                        onRefresh: (){
                          BlocProvider.of<WeatherBloc>(context).add(WeatherEventRefresh(city: weather.location));
                          return _completer.future;
                        },

                        child: Column(

                          children: [
                            Row(
                              children: [
                                IconButton(
                                    icon: SvgPicture.asset(CustomIcons.geolocation)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(weather.location),
                                    Text('${TimeOfDay.fromDateTime(weather.lastUpdated).format(context)}')
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 24,),
                            Text('${weather.temp.toInt().toString()}°',
                              style: TextStyle(color: ColorPalette.black, fontSize: 24),),
                            IconButton(icon: themeState.icon[0]),
                            Text(weather.weatherCondition.toString().split('.')[1],
                              style: TextStyle(color: ColorPalette.black, fontSize: 16),),
                            const SizedBox(height: 24,),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: ColorPalette.background
                              ),
                              child: Weathers(weatherState.weathers),
                            ),
                            const SizedBox(height: 24,),
                            Details(weatherState.weathers[0]),
                            const SizedBox(height: 8,),
                          ],
                        ),
                      );
                    });

              }
              if(weatherState is WeatherStateFailure){
                return Text("Something Went Wrong . Check Your Internet Connection" , style: TextStyle(color: Colors.black),);
              }
              return Container(child: Text(weatherState.toString()));

  }
        ),
    ),
      )
    );
    }

  Widget _getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(230),
      child: AppBar(
        backgroundColor: ColorPalette.black,
        elevation: 0,
        leading: Icon(Icons.more_vert , color: ColorPalette.main_color,),
        title: Text(Variables.skyMonitor, style: TextThemes.search_text,),
        actions: [
          IconButton(icon: SvgPicture.asset(CustomIcons.profile), onPressed: (){})
        ],
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Align(alignment: Alignment.center,child: AppBarWidget("search city" , _controller)),

        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: ColorPalette.main_color,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30) , topLeft: Radius.circular(30)),
            ),
          ),
        ),
      ),
    );
  }
  }
