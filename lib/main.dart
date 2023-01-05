import 'package:flutter/material.dart';
import 'package:get_address/get_lat_long_address.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
          primarySwatch: Colors.amber,
          textTheme: TextTheme(
              // titleLarge: TextStyle(color: Colors.blue),
              // titleMedium: TextStyle(color: Colors.purple),
              // titleSmall: TextStyle(color: Colors.purple),
              // button: TextStyle(color: Colors.pink),
              // bodyLarge: TextStyle(color: Colors.pink),
              // bodyMedium: TextStyle(color: Colors.pink),
              // bodySmall: TextStyle(color: Colors.pink),
              headline2: TextStyle(
                color: Colors.pink
              ),
              headline6: TextStyle(
                color: Colors.pink
              ),
              bodyText1: TextStyle(color: Colors.white))),
      home: const GetLatLongView(),
    );
  }
}
