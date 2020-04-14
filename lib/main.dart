import 'package:flutter/material.dart';
import 'package:globaltime/pages/choose_location.dart';
import 'package:globaltime/pages/home.dart';
import 'package:globaltime/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',

  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLoacation()
  },
));

