import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            margin: EdgeInsets.all(20),
            child: ListView(
              children: WeatherForecast.values
                  .map(
                    (weather) => WeatherForecastCard(
                      weatherForecast: weather,
                    ),
                  )
                  .toList(),
            )),
      ),
    ),
  );
}

enum WeatherForecast {
  PhnomPenh(
      name: "PhnomPenh",
      min: "10.0°C",
      max: "30.0°C",
      temp: "12.2°C",
      color: [
        Color(0xFFB07CF0),
        Color(0xFF9B1FFF),
      ],
      imagePath: "assets/ex4/cloudy.png"),
  Paris(
      name: "Paris",
      min: "10.0°C",
      max: "40.0°C",
      temp: "22.2°C",
      color: [
        Color(0xFF7AF0B5),
        Color(0xFF42C783),
      ],
      imagePath: "assets/ex4/sunnyCloudy.png"),
  Rome(
      name: "Rome",
      min: "10.0°C",
      max: "40.0°C",
      temp: "45.2°C",
      color: [
        Color(0xFFF58EB5),
        Color(0xFFBA4159),
      ],
      imagePath: "assets/ex4/sunny.png"),
  Toulouse(
      name: "Toulouse",
      min: "10.0°C",
      max: "40.0°C",
      temp: "45.2°C",
      color: [
        Color(0xFFC79154),
        Color(0xFFD48831),
      ],
      imagePath: "assets/ex4/veryCloudy.png");

  const WeatherForecast(
      {required this.name,
      required this.min,
      required this.max,
      required this.temp,
      required this.color,
      required this.imagePath});

  final String name;
  final String min;
  final String max;
  final String temp;
  final String imagePath;
  final List<Color> color;
}

class WeatherForecastCard extends StatelessWidget {
  final WeatherForecast weatherForecast;
  const WeatherForecastCard({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: weatherForecast.color,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4))
              ]),
          child: Stack(
            children: [
              Positioned(
                right: -40,
                top: -20,
                bottom: -20,
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withValues(alpha: 0.15),
                        Colors.white.withValues(alpha: 0.05),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        weatherForecast.imagePath,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weatherForecast.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            weatherForecast.min,
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                          Text(
                            weatherForecast.max,
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      weatherForecast.temp,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
