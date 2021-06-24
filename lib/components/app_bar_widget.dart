import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/blocs/weather_bloc/weather_bloc.dart';

import 'package:weather/resources/icons.dart';
import 'package:weather/theme/color_theme.dart';
import 'package:weather/theme/text_theme.dart';

class AppBarWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController _controller ;
  AppBarWidget(this.hintText , this._controller);
  @override
  _AppBarState createState() => _AppBarState(hintText , _controller);
}
class _AppBarState extends State<AppBarWidget> {
  final TextEditingController _controller ;

  final String hintText ;
  _AppBarState(this.hintText , this._controller);

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.text,
        controller: _controller,
        style: TextStyle(color:  ColorPalette.main_color),
        decoration: InputDecoration(
          // prefixIcon: IconButton(icon: SvgPicture.asset(CustomIcons.search),) ,
          hintText: this.hintText,

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  width: 1,
                  color: ColorPalette.main_color
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  width: 1,
                  color: ColorPalette.main_color
              )
          ),
          suffixIcon: IconButton(
              icon: SvgPicture.asset(CustomIcons.search),
              onPressed: ()  async {
                final typedCity = _controller.text ;
                if(typedCity != null) {
                  BlocProvider.of<WeatherBloc>(context).add(WeatherEventRequested(city :_controller.text));

                }
              }),
          hintStyle: TextThemes.search_text.copyWith(
              color: ColorPalette.main_color),

          filled: true,
          contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }






}