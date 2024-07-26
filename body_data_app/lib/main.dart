import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'home_page.dart';
import 'poop_data_page.dart';
import 'medicine_data_page.dart';
import 'food_data_page.dart';
import 'journal_data_page.dart';
import 'sleep_data_page.dart';
import 'mood_data_page.dart';
import 'thought_data_page.dart';
import 'database_helper.dart';
import 'drift_database.dart';
import 'dart:io';


late final AppDatabase appDatabase;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Request necessary permissions
  await requestPermissions();


  // Initialize the appropriate database factory
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    // Initialize sqflite_common_ffi for desktop
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  } else {
    // Initialize sqflite for mobile
    databaseFactory = databaseFactory; // This is just to emphasize we're using the default factory for mobile
  }

  appDatabase = await AppDatabase();
  _setupLogging();
  // Run your Flutter app
  runApp(MyApp());
}

Future<void> requestPermissions() async {
  if (kIsWeb || (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    return; // No permissions needed on desktop/web
  }

  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
    Permission.camera,
    Permission.photos,
  ].request();

  if (statuses[Permission.storage]?.isDenied ?? false) {
    // Handle storage permission denied
  }

  if (statuses[Permission.camera]?.isDenied ?? false) {
    // Handle camera permission denied
  }

  if (statuses[Permission.photos]?.isDenied ?? false) {
    // Handle gallery/photos permission denied
  }
}

void _setupLogging() {
  Logger.root.level = Level.ALL; // Set the root logger level to ALL
  Logger.root.onRecord.listen((record) {
    // Print log messages to the console
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // The app is now in the foreground
      print('App resumed');
      // Add your code to check for sleep or thought entries here
    } else if (state == AppLifecycleState.paused) {
      // The app is now in the background
      print('App paused');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Body Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BodyDataHomePage(),
      routes: {
        '/poopData': (context) => PoopDataPage(),
        '/medicineData': (context) => MedicineDataPage(),
        '/journalData': (context) => JournalDataPage(),
        '/foodData': (context) => FoodDataPage(),
        '/moodData': (context) => MoodDataPage(),
        '/sleepData': (context) => SleepDataPage(),
        '/thoughtData': (context) => ThoughtDataPage(),
      },
    );
  }
}
