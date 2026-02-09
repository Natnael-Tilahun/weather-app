import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forcast_item.dart';
import 'package:http/http.dart' as http;

class WeatherAppScreen extends StatefulWidget {
  const WeatherAppScreen({super.key});

  @override
  State<WeatherAppScreen> createState() => _WeatherAppScreenState();
}

class _WeatherAppScreenState extends State<WeatherAppScreen> {
  late Future<Map<String, dynamic>> weather;
  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    String cityName = 'Addis Abeba';
    String apiKey = dotenv.env['API_KEY'] ?? '';
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$apiKey',
        ),
      );
      final data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw data['message'];
      }

      // temp = (data['list'][0]['main']['temp']);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                weather = getCurrentWeather();
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final data = snapshot.data!;
          final currentWeatherData = data['list'][0];
          final currentTemp = currentWeatherData['main']['temp'];
          final currentSky = currentWeatherData['weather'][0]['main'];
          final currentPressure = currentWeatherData['main']['pressure'];
          final currentWindSpeed = currentWeatherData['wind']['speed'];
          final currentHumidity = currentWeatherData['main']['humidity'];
          final currentCity = data['city']['name'];
          final currentCountry = data['city']['country'];

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 20,
              children: [
                // main card
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            spacing: 10,
                            children: [
                              Text(
                                '$currentTemp K',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                              Text('$currentCity , $currentCountry'),

                              Icon(
                                currentSky == 'Clouds' || currentSky == 'Rain'
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 64,
                              ),
                              Text(currentSky, style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // weather forcast
                Column(
                  spacing: 8,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hourly Forcast',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 140,
                      child: ListView.builder(
                        itemCount: 9,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final hourlyForecast = data['list'][index + 1];
                          final hourlySky =
                              data['list'][index + 1]['weather'][0]['main'];
                          final hourlyTemp =
                              data['list'][index + 1]['weather'][0]['main'];
                          //                   .toString();

                          final time = DateTime.parse(hourlyForecast['dt_txt']);

                          return HourlyForcastItem(
                            time: DateFormat.j().format(time),
                            icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                                ? Icons.cloud
                                : Icons.sunny,
                            tempValue: hourlyTemp,
                          );
                        },
                      ),
                    ),
                  ],
                ),

                // additional informations
                Column(
                  spacing: 10,
                  children: [
                    Align(
                      alignment: .centerLeft,
                      child: Text(
                        'Additional Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AdditionalInfoItem(
                          icon: Icons.water_drop,
                          tempratureType: 'Humidity',
                          tempratureValue: currentHumidity.toString(),
                        ),
                        AdditionalInfoItem(
                          icon: Icons.air,
                          tempratureType: 'Wind Speed',
                          tempratureValue: currentWindSpeed.toString(),
                        ),
                        AdditionalInfoItem(
                          icon: Icons.beach_access,
                          tempratureType: 'Pressure',
                          tempratureValue: currentPressure.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
