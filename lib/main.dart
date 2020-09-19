import 'package:flutter/material.dart';
import 'package:movie/ui/SplassScreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie App",
      color: Colors.red[300],
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.red[300]
      ),
      home: SplassScreen(),
    );
  }
}

