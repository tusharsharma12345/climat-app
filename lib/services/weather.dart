import 'package:climat/services/location.dart';
import 'package:climat/services/networking.dart';
const appkey = '289eca3069f5016451665b5b4077ffd5';
class WeatherModel {
  double? lat;
  double? lon;
  Future<dynamic> getCityWeather(String cityName)async{
    var url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=289eca3069f5016451665b5b4077ffd5&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationWeather()async{
    Locatione locatione = Locatione();
    await locatione.getCurrentlocation();
    lon =locatione.longitute;
    lat = locatione.latitute;
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$appkey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}