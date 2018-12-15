import 'package:flutter/material.dart';
import './HomeUserInterface.dart';
import 'package:flutter_weather_app/HTTP/httpUtils.dart';
import 'dart:core';
import 'package:intl/intl.dart';

class WeatherAppBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyWeatherAppBody();
  }
}

class MyWeatherAppBody extends State<WeatherAppBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 150.0),),
          Container(
            child:displayWeatherData('${MyWeatherApp.cityName}'),
          )
        ],
      ),
    );
  }
  
   Widget displayWeatherData(String city){
    return new FutureBuilder(
        future: HttpUtils.getWeatherData(city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
          if(snapshot.hasData){
            Map weatherData = snapshot.data;
            return Container(
              child: Column(
                children: <Widget>[
                  Text((weatherData['main']['temp']-273.15).toStringAsPrecision(4)+" "+new String.fromCharCodes(new Runes('\u2103')),style: TextStyle(color: Colors.black,fontFamily: 'Oswald',fontSize: 34.0),),
                  Text((new DateFormat.yMMMEd().format(new DateTime.now())).toString(),style: TextStyle(color: Colors.grey.shade800,fontFamily: 'Oswald'),),
                  Text(weatherData['name'].toString().toUpperCase(),style: TextStyle(color: Colors.grey.shade800,fontFamily: 'Oswald',fontSize: 24.0),),
                  Padding(padding: EdgeInsets.only(top:5.0),),
                  Text(weatherData['weather'][0]['description'].toString().toUpperCase(),style: TextStyle(color: Colors.grey.shade800,fontSize: 18.0,fontFamily: 'Oswald'),),
                  Padding(padding: EdgeInsets.only(top: 3.0),),
                  Image.network("http://openweathermap.org/img/w/${weatherData['weather'][0]['icon']}.png"),
                ],
              ),
            );
          }
        });
   }
   
   
}
