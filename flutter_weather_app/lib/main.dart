import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: "Flutter Weather App",
      home: WeatherApp(),
    ));

class WeatherApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyWeatherApp();
  }
}

class MyWeatherApp extends State<WeatherApp> {
  Widget _cityName = new Text(
    "Vadodara",
    textDirection: TextDirection.ltr,
    style: cityTextStyle(),
  );

  Icon _searchIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  final cityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: _cityName,
        actions: <Widget>[
          IconButton(
            icon: _searchIcon,
            onPressed: _searchPressed,
          )
        ],
      ),
    );
  }

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = new Icon(
          Icons.close,
          color: Colors.white,
        );
        _cityName = new TextField(
          controller: cityNameController,
          style: TextStyle(color: Colors.white),
          decoration: new InputDecoration(
            focusedBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.white),
            ),
            hintText: "Enter a City Name",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            prefixIcon: Icon(Icons.search, color: Colors.white),
          ),
        );
      } else {
        _searchIcon = new Icon(
          Icons.search,
          color: Colors.white,
        );
        if (!cityNameController.text.isEmpty) {
          _cityName = Text(cityNameController.text);
        }

        cityNameController.clear();
      }
    });
  }
}

//StyleForCityName
TextStyle cityTextStyle() {
  return new TextStyle(color: Colors.white, fontFamily: 'Oswald');
}
