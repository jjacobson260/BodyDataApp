import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'poop_entry_dialog.dart';
import 'poop_data_page.dart';
import 'medicine_entry_dialog.dart';
import 'medicine_data_page.dart';
import 'food_entry_dialog.dart';
import 'food_data_page.dart';
import 'mood_entry_dialog.dart';
import 'mood_data_page.dart';
import 'journal_entry_dialog.dart';
import 'journal_data_page.dart';
import 'sleep_entry_dialog.dart';
import 'sleep_options_dialog.dart';
import 'sleep_data_page.dart';
import 'thought_entry_dialog.dart';
import 'thought_data_page.dart';
import 'thought_options_dialog.dart';
import 'database_helper.dart';
import 'package:logging/logging.dart';
import 'models/sleep.dart';
import 'models/thought.dart';

class BodyDataHomePage extends StatefulWidget {
  BodyDataHomePage({Key? key}) : super(key: key);

  @override
  _BodyDataHomePageState createState() => _BodyDataHomePageState();
}

class _BodyDataHomePageState extends State<BodyDataHomePage> with WidgetsBindingObserver {
  Color poopButtonColor = Colors.red;
  Color medicineButtonColor = Colors.orange;
  Color foodButtonColor = Colors.yellow;
  Color moodButtonColor = Colors.green;
  Color journalButtonColor = Colors.blue;
  Color thoughtButtonColor = Color(0xFF8A2BE2);
  Color sleepButtonColor = Colors.indigo;
  
  bool isSleepButtonActive = false;
  bool isThoughtButtonActive = false;

  final Logger _logger = Logger('DatabaseHelper');

  
  @override
  void initState() {
    super.initState();
    _logger.info("HomePage initialized");
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final lifecycleState = WidgetsBinding.instance.lifecycleState;
      if (lifecycleState != null) {
        _checkAppLifecycleState(lifecycleState);
      }
    });
    
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _checkAppLifecycleState(state);
  }

  void _checkAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _logger.info("App resumed");
      _checkAndRunFunctions(); // Replace with your function names
    }
  }

  void _checkAndRunFunctions() {
    // Example: Checking and running sleep and thought functions
    _checkAndShowSleepDialog();
    _checkAndShowThoughtDialog();
  }

  Future<void> _toggleSleepButton() async {
    final dbHelper = DatabaseHelper();
    setState(() {
      if (isSleepButtonActive) {
        isSleepButtonActive = false;
        _cancelSleep(context);
      } else {
        _insertSleepData(context);
        isSleepButtonActive = true;
      }
    });
  }

  void _cancelSleep(BuildContext context) async {
    final dbHelper = DatabaseHelper();
    final int? id = await dbHelper.getMaxSleepLogId();
    if (id != null) {
      await dbHelper.deleteSleepData(id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sleep Canceled')),
      );
    }
  }

  void _checkAndShowSleepDialog() async {
    _logger.info("Checking STILL_ASLEEP value");
    final dbHelper = DatabaseHelper();
    var sleepLog = await dbHelper.getStillAsleepEntry();

    if (sleepLog != null ) {
      _logger.info("STILL_ASLEEP is true");
      final sleepLogId = sleepLog.id;
      final sleepTime = sleepLog.sleep_time;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) {
            return SleepEntryDialog();
          },
        );
      });
    }
  }
  
  void _insertSleepData(BuildContext context) async {
    
    final currentTime = DateTime.now();
    Sleep sleepData = Sleep();
    sleepData.timestamp = currentTime;
    sleepData.sleep_time = currentTime; 
    sleepData.STILL_ASLEEP = true;

    await DatabaseHelper().insertSleepData(sleepData);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Sleep Time Started, tap again to cancel'),
    ));
  }

  
  Future<void> _toggleThoughtButton() async {
    final dbHelper = DatabaseHelper();
    setState(() {
      if (isThoughtButtonActive) {
        isThoughtButtonActive = false;
        _cancelThought(context);
      } else {
        _insertThoughtData(context);
        isThoughtButtonActive = true;
      }
    });
  }

  void _cancelThought(BuildContext context) async {
    final dbHelper = DatabaseHelper();
    final int? id = await dbHelper.getMaxThoughtLogId();
    if (id != null) {
      await dbHelper.deleteThoughtData(id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Thought Canceled')),
      );
    }
  }

  void _checkAndShowThoughtDialog() async {
    _logger.info("Checking STILL_THINKING value");
    final dbHelper = DatabaseHelper();
    final thought = await dbHelper.getStillThinkingEntry();

    if (thought != null) {
      _logger.info("STILL THINKING is true");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) {
            return ThoughtEntryDialog();
          },
        );
      });
    }
  }


  void _insertThoughtData(BuildContext context) async {
    final currentTime = DateTime.now();

    var thoughtData = Thought();
    thoughtData.timestamp = currentTime;
    thoughtData.length = null;
    thoughtData.depth = null;
    thoughtData.thought_log = '';
    thoughtData.STILL_THINKING = true;
    
    await DatabaseHelper().insertThoughtData(thoughtData);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Thought Time Started, tap again to cancel'),
    ));
  }

  void _navigateToPoopDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PoopDataPage(),
      ),
    );
  }

  void _navigateToMedicineDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MedicineDataPage(),
      ),
    );
  }

  void _navigateToFoodDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodDataPage(),
      ),
    );
  }

  void _navigateToMoodDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MoodDataPage(),
      ),
    );
  }

  void _navigateToJournalDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => JournalDataPage(),
      ),
    );
  }

  void _navigateToSleepDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SleepDataPage(),
      ),
    );
  }

  void _navigateToThoughtDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ThoughtDataPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'Poop Data':
                  _navigateToPoopDataPage(context);
                  break;
                case 'Medicine Data':
                  _navigateToMedicineDataPage(context);
                  break;
                case 'Food Data':
                  _navigateToFoodDataPage(context);
                  break;
                case 'Mood Data':
                  _navigateToMoodDataPage(context);
                  break;
                case 'Journal Data':
                  _navigateToJournalDataPage(context);
                  break;
                case 'Sleep Data':
                  _navigateToSleepDataPage(context);
                  break;
                case 'Thought Data':
                  _navigateToThoughtDataPage(context);
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'Sleep Data',
                  child: Text('Sleep Data'),
                ),
                PopupMenuItem(
                  value: 'Thought Data',
                  child: Text('Thought Data'),
                ),
                PopupMenuItem(
                  value: 'Journal Data',
                  child: Text('Journal Data'),
                ),
                PopupMenuItem(
                  value: 'Mood Data',
                  child: Text('Mood Data'),
                ),
                PopupMenuItem(
                  value: 'Food Data',
                  child: Text('Food Data'),
                ),
                PopupMenuItem(
                  value: 'Medicine Data',
                  child: Text('Medicine Data'),
                ),
                PopupMenuItem(
                  value: 'Poop Data',
                  child: Text('Poop Data'),
                ),   
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
              'Body Data',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/icon/app_icon_transparent.png',
                height: 170,
                width: 170,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        // onPressed: () => _toggleSleepButton(),
                        onPressed: isSleepButtonActive ? () => _toggleSleepButton() : () => _openSleepOptionsDialog(context),
                        child: Text('😴'),
                        style: ElevatedButton.styleFrom(backgroundColor: isSleepButtonActive ? sleepButtonColor : sleepButtonColor.withOpacity(0.5)),
                      ),
                      SizedBox(height: 7),
                      ElevatedButton(
                        onPressed: isThoughtButtonActive ? () => _toggleThoughtButton() : () => _openThoughtOptionsDialog(context),
                        child: Text('🧠'),
                        style: ElevatedButton.styleFrom(backgroundColor: isThoughtButtonActive ? thoughtButtonColor : thoughtButtonColor.withOpacity(0.5)),
                      ),
                      SizedBox(height: 7),
                      ElevatedButton(
                        onPressed: () => _openJournalDialog(context),
                        child: Text('📝'),
                        style: ElevatedButton.styleFrom(backgroundColor: journalButtonColor.withOpacity(0.5)),
                      ),
                      SizedBox(height: 7),
                      
                      ElevatedButton(
                        onPressed: () => _openMoodDialog(context),
                        child: Text('🎭'),
                        style: ElevatedButton.styleFrom(backgroundColor: moodButtonColor.withOpacity(0.5)),
                      ), 
                      SizedBox(height: 7),
                      ElevatedButton(
                        onPressed: () => _openFoodDialog(context),
                        child: Text('🥣'),
                        style: ElevatedButton.styleFrom(backgroundColor: foodButtonColor.withOpacity(0.5)),
                      ),
                      SizedBox(height: 7),
                      ElevatedButton(
                        onPressed: () => _openMedicineDialog(context),
                        child: Text('⚕️'),
                        style: ElevatedButton.styleFrom(backgroundColor: medicineButtonColor.withOpacity(0.5)),
                      ),
                      SizedBox(height: 7),
                      ElevatedButton(
                        onPressed: () => _openPoopDialog(context),
                        child: Text('💩'),
                        style: ElevatedButton.styleFrom(backgroundColor: poopButtonColor.withOpacity(0.5)),
                      ),               
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _openPoopDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PoopEntryDialog();
      },
    );
  }

  void _openMedicineDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MedicineEntryDialog();
      },
    );
  }

  void _openFoodDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FoodEntryDialog();
      },
    );
  }

  void _openMoodDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MoodEntryDialog();
      },
    );
  }

  void _openJournalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return JournalEntryDialog();
      },
    );
  }

  void _openSleepOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SleepOptionsDialog(
          onStartSleep: () => _toggleSleepButton(),
        );
      },
    );
  }

  void _openThoughtOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ThoughtOptionsDialog(
          onStartThinking: () => _toggleThoughtButton(),
        );
      },
    );
  }
}
