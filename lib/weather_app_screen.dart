import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forcast_item.dart';

class WeatherAppScreen extends StatelessWidget {
  const WeatherAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather App',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
          centerTitle: true,
        ),
        body: Padding(
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
                              '300K',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                              ),
                            ),
                            Icon(Icons.cloud, size: 64),
                            Text('Rain', style: TextStyle(fontSize: 20)),
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
                      'Weather Forcast',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HourlyForcastItem(
                          time: '00:00',
                          icon: Icons.cloud,
                          tempValue: 301.22,
                        ),
                        HourlyForcastItem(
                          time: '03:00',
                          icon: Icons.sunny,
                          tempValue: 300.52,
                        ),
                        HourlyForcastItem(
                          time: '06:00',
                          icon: Icons.cloud,
                          tempValue: 302.22,
                        ),
                        HourlyForcastItem(
                          time: '09:00',
                          icon: Icons.sunny,
                          tempValue: 300.12,
                        ),
                        HourlyForcastItem(
                          time: '12:00',
                          icon: Icons.cloud,
                          tempValue: 304.12,
                        ),
                      ],
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
                        tempratureValue: 94,
                      ),
                      AdditionalInfoItem(
                        icon: Icons.air,
                        tempratureType: 'Wind Speed',
                        tempratureValue: 7.64,
                      ),
                      AdditionalInfoItem(
                        icon: Icons.beach_access,
                        tempratureType: 'Pressure',
                        tempratureValue: 1006,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
