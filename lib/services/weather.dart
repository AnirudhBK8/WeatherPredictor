import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = '6feb64ed7cb831904dc723ddf236db37';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Networking networkHelper =
        Networking('$openWeatherURL?q=$cityName&appid=$apikey&units=metric');
    var decodedData = await networkHelper.getdata();
    return decodedData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    Networking networkHelper = Networking(
        '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var decodedData = await networkHelper.getdata();
    return decodedData;
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
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
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
