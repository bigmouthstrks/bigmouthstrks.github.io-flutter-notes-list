import 'package:flutter/material.dart';
import 'package:noteslist/src/pages/registro_form.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('es'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff50d890),
        secondaryHeaderColor: Color(0xff4f98ca),
        splashColor: Color(0xffeffffb),
        primaryColorDark: Color(0xff42b377),
        primaryColorLight: Color(0xffeffffb),
        fontFamily: 'Source Sans Pro',
        textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              fontFamily: 'Playfair Display',
              color: Colors.black,
            ),
            headline2: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontFamily: 'Source Sans Pro',
            )),
      ),
      home: RegistroForm(),
    );
  }
}
