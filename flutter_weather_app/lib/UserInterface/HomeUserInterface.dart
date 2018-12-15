import 'package:flutter/material.dart';
import './BodyOfWeatherApp.dart';

class WeatherApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyWeatherApp();
  }
}

class MyWeatherApp extends State<WeatherApp> {
  Widget _cityName = new Text(
    cityName,
    textDirection: TextDirection.ltr,
    style: cityTextStyle(),
  );

  Icon _searchIcon = new Icon(
    Icons.search,
    color: Colors.black,
  );

  static String cityName = "Vadodara";
  final cityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: _cityName,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: _searchIcon,
            onPressed: _searchPressed,
          ),
        ],
      ),

      drawer: new Drawer(),

      body: WeatherAppBody(),
    );
  }

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = new Icon(
          Icons.close,
          color: Colors.black,
        );
        _cityName = new TextField(
          controller: cityNameController,
          style: TextStyle(color: Colors.black),
          decoration: new InputDecoration(
            focusedBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.white),
            ),
            hintText: "Enter a City Name",
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            prefixIcon: Icon(Icons.search, color: Colors.black),
          ),
        );
      } else {
        _searchIcon = new Icon(
          Icons.search,
          color: Colors.black,
        );
        if (!cityNameController.text.isEmpty) {
          cityName = cityNameController.text;
          if (cityName.length > 1) {
            cityName = cityName[0].toUpperCase() + cityName.substring(1);
          } else {
            cityName = cityName.toUpperCase();
          }
          _cityName = Text(
            cityName,
            style: cityTextStyle(),
          );
        } else {
          _cityName = Text(
            cityName,
            style: cityTextStyle(),
          );
        }

        cityNameController.clear();
      }
    });
  }
}

//StyleForCityName
TextStyle cityTextStyle() {
  return new TextStyle(color: Colors.black, fontFamily: 'Oswald');
}
