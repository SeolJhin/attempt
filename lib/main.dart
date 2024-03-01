import 'package:attempt_dart/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}


