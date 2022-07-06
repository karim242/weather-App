import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = '472ff8e2fe2443c11d517306e9bd7558';
const openWeatherMapUrl='https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {
////for CitName
Future<dynamic> getCityWeather(String cityName)async {
  NetworkHelper networkHelper=NetworkHelper
    ('$openWeatherMapUrl?q=$cityName&appid=$apikey&units=metric');

  var weatherData = await networkHelper.getData();
  return weatherData;
}
////for long and lati
  Future<dynamic> getlocationWeather()async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${location
            .latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

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