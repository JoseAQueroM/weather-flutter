import 'package:weather/services/location.dart';
import 'networking.dart';

const apiKey = 'dbcfbc1da42db345e17654c741952071';

class WeatherModel {

  Future<dynamic> getInputCity(String cityName) async{
    var url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    
    Location location = Location();
    await location.getCurrentLocation();
    var latitude = location.latitude;
    var longitude = location.longitude;

    NetworkHelper networkHelper =NetworkHelper(
      url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'
      );
    
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '🌞';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

    String getMessage(temp) {
      if (temp > 25) {
        return 'It\'s 🍦 time';
      } else if (temp > 20) {
        return 'Time for shorts and 👕';
      } else if (temp < 10) {
        return 'You\'ll need 🧣 and 🧤';
      } else {
        return 'Bring a 🧥 just in case';
      }
    }
  }
