import 'package:flutter/cupertino.dart';
import 'package:weather/domain/models/weather.dart';
import 'package:weather/presentation/widgets/weather_item.dart';



class Weathers extends StatelessWidget{
  List<Weather> weathers;
  Weathers(this.weathers);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context , index) =>  WeatherItem(weathers[index], index) ) ;
  }

}