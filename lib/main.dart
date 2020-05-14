import 'package:flutter/material.dart';
import 'package:noteslist/src/pages/tabs_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: 
      ThemeData(
        fontFamily: 'Source Sans Pro',
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            fontFamily: 'Playfair Display',
            color: Colors.black,
          ),
          body1: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            fontFamily: 'Source Sans Pro',
          )
        ),
      ),
      home: TabsPage(),
    );
  }
}