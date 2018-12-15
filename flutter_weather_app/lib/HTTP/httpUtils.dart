import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpUtils{
  static final API_ID = "b06d75dc7256627c6c5f95131af3501a";

  static Future<Map> getWeatherData(String city)async{
    String apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=$city&APPID=$API_ID";
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }
}