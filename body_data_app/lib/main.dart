import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:logging/logging.dart';
import 'home_page.dart';
import 'poop/poop_data_page.dart';
import 'medicine/medicine_data_page.dart';
import 'food/food_data_page.dart';
import 'journal/journal_data_page.dart';
import 'sleep/sleep_data_page.dart';
import 'mood/mood_data_page.dart';
import 'thought/thought_data_page.dart';
import 'database_helper.dart';
import 'dart:io';



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

  _setupLogging();
  // init database
  DatabaseHelper dbHelper = DatabaseHelper();
  dbHelper.initDatabase();
  // Run your Flutter app
  runApp(const MyApp());
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
  const MyApp({super.key});

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
      home: const BodyDataHomePage(),
      routes: {
        '/poopData': (context) => const PoopDataPage(),
        '/medicineData': (context) => const MedicineDataPage(),
        '/journalData': (context) => const JournalDataPage(),
        '/foodData': (context) => const FoodDataPage(),
        '/moodData': (context) => const MoodDataPage(),
        '/sleepData': (context) => const SleepDataPage(),
        '/thoughtData': (context) => const ThoughtDataPage(),
      },
    );
  }
}
