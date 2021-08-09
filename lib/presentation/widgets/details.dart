import 'package:flutter/cupertino.dart';
import 'package:weather/domain/models/weather.dart';
import 'package:weather/presentation/utils/color_theme.dart';

class Details extends StatelessWidget{

  final Weather weather ;

  Details(this.weather);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 155,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ColorPalette.background
      ),
      child:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Details"),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Min Temp"),
                Text('${weather.minTemp.toInt().toString()}°')
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Max Temp"),
                Text('${weather.maxTemp.toInt().toString()}°')
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Air Pressure"),
                Text('${weather.airPressure.toString()}')
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Humidity"),
                Text('${weather.humidity.toString()}')
              ],
            ),

          ],
        ),
      ),
    );
  }

}