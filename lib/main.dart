import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather_app/screen/homescreen.dart';
import 'package:weather/weather_app/services/locationprovider.dart';
import 'package:weather/weather_app/services/themeprovider.dart';
import 'package:weather/weather_app/services/weatherserviceprovider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => WeatherServiceProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: ThemeData(
              appBarTheme: AppBarTheme(color: Colors.transparent),
              useMaterial3: true,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            darkTheme: ThemeData.dark().copyWith(
              appBarTheme: AppBarTheme(color: Colors.black),
              scaffoldBackgroundColor: Colors.black,



            ),
            themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
