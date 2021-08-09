import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:weather/presentation/utils/icons.dart';
import 'package:weather/presentation/utils/routes.dart';
import 'package:weather/presentation/utils/variables.dart';
import 'package:weather/presentation/utils/color_theme.dart';
import 'package:weather/presentation/utils/text_theme.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.main_color,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Text(Variables.question , style: TextThemes.main_text,),
              const SizedBox(height: 24,),
              SvgPicture.asset(CustomIcons.image , height: 450, ),
              const SizedBox(height: 24,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    primary: ColorPalette.black
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Text(
                    Variables.todayWeather,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                onPressed: () {

                  Navigator.of(context).push(Routes().goToMain()) ;
                },
              )

            ],
          ),
        ),
      ),
    );
  }

}