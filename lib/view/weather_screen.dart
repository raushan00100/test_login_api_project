import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/weather_controller.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    // Auto-fetch weather on screen load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WeatherProvider>(context, listen: false).fetchWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text('Weather'),
        backgroundColor: Colors.cyan,
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.weather == null
          ? Center(
        child: ElevatedButton(
          onPressed: () => provider.fetchWeather(),
          child: const Text("Get Weather"),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Location: ${provider.weather!.name}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Weather: ${provider.weather!.weather?[0].main ?? "N/A"}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Description: ${provider.weather!.weather?[0].description ?? "N/A"}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    Text(
                      "Temperature: ${provider.weather!.main?.temp} °C",
                    ),
                    Text(
                      "Temperature: ${provider.weather!.main?.feelsLike} °C",
                    ),
                    Text(
                      "Temperature: ${provider.weather!.main?.tempMin} °C",
                    ),
                    Text(
                      "Temperature: ${provider.weather!.main?.tempMax} °C",
                    ),
                    Text(
                      "Temperature: ${provider.weather!.main?.pressure} °C",
                    ),
                    Text(
                      "Temperature: ${provider.weather!.main?.humidity} °C",
                    ),
                    Text(
                      "Temperature: ${provider.weather!.main?.seaLevel ?? "__"}",
                    ),
                    Text(
                      "Temperature: ${provider.weather!.main?.grndLevel ?? "__"}",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("Visibility: ${provider.weather!.visibility ?? "__"} m"),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    Text(
                      "Wind Speed: ${provider.weather!.wind?.speed ?? "__"} m/s",
                    ),
                    Text(
                      "Wind Speed: ${provider.weather!.wind?.deg ?? "__"} m/s",
                    ),
                    Text(
                      "Wind Speed: ${provider.weather!.wind?.gust ?? "__"} m/s",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}