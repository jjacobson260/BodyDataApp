import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'poop_entry_dialog.dart';
import 'poop_data_page.dart';
import 'pill_entry_dialog.dart';
import 'pill_data_page.dart';
import 'food_entry_dialog.dart';
import 'food_data_page.dart';
import 'mood_entry_dialog.dart';
import 'mood_data_page.dart';
import 'journal_entry_dialog.dart';
import 'journal_data_page.dart';
import 'sleep_entry_dialog.dart';
import 'sleep_data_page.dart';
import 'mind_data_page.dart';
import 'database_helper.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color poopButtonColor = Colors.red;
  Color pillButtonColor = Colors.orange;
  Color foodButtonColor = Colors.yellow;
  Color moodButtonColor = Colors.green;
  Color journalButtonColor = Colors.blue;
  Color mindButtonColor = Color(0xFF8A2BE2);
  Color sleepButtonColor = Colors.indigo;
  
  bool isSleepButtonActive = false;

  @override
  void initState() {
    super.initState();
    _checkAndShowSleepDialog();
  }

  void _toggleSleepButton() {
    setState(() {
      if (isSleepButtonActive) {
        isSleepButtonActive = false;
        _cancelSleep(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sleep Canceled')),
        );
      } else {
        isSleepButtonActive = true;
      }
    });
  }

  void _checkAndShowSleepDialog() async {
    final db = await DatabaseHelper().database;
    await db.execute('''
      CREATE TABLE IF NOT EXISTS sleep_log (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp TEXT,
        sleep_time TEXT,
        wake_time TEXT,
        dream_log TEXT,
        STILL_ASLEEP INTEGER
      )
    ''');
    final List<Map<String, dynamic>> sleepLogs = await db.query(
      'sleep_log',
      where: 'STILL_ASLEEP = ?',
      whereArgs: [1],
      orderBy: 'timestamp DESC',
      limit: 1,
    );

    if (sleepLogs.isNotEmpty) {
      final sleepLog = sleepLogs.first;
      final sleepLogId = sleepLog['id'];
      final sleepTime = DateTime.parse(sleepLog['sleep_time']);

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
    _toggleSleepButton();
    String currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    await DatabaseHelper().insertSleepData(timestamp: currentTime, sleepTime: currentTime, wakeTime: null, dreamLog: null, wakingUp: false);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Sleep data saved'),
    ));
  }

  

  void _cancelSleep(BuildContext context) async {
    final id = await DatabaseHelper().getMaxSleepLogId();
    await DatabaseHelper().deleteSleepData(id);
  }

  void _insertMindData(BuildContext context) async {
    String currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    Map<String, dynamic> mindData = {
        'timestamp': currentTime,
        'length': null,
        'depth': null,
        'thought_log': null,
      };
    
    //await DatabaseHelper().insertMindData(mindData: mindData);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Sleep data saved'),
    ));
  }

  void _navigateToPoopDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PoopDataPage(),
      ),
    );
  }

  void _navigateToPillDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PillDataPage(),
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

  void _navigateToMindDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MindDataPage(),
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
                case 'Pill Data':
                  _navigateToPillDataPage(context);
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
                case 'Mind Data':
                  _navigateToMindDataPage(context);
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
                  value: 'Mind Data',
                  child: Text('Mind Data'),
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
                  value: 'Pill Data',
                  child: Text('Pill Data'),
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
                        onPressed: () => _insertSleepData(context),
                        child: Text('😴'),
                        style: ElevatedButton.styleFrom(backgroundColor: isSleepButtonActive ? sleepButtonColor : sleepButtonColor.withOpacity(0.5)),
                      ),
                      SizedBox(height: 7),
                      ElevatedButton(
                        onPressed: () => _insertMindData(context),
                        child: Text('🧠'),
                        style: ElevatedButton.styleFrom(backgroundColor: mindButtonColor.withOpacity(0.5)),
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
                        onPressed: () => _openPillDialog(context),
                        child: Text('💊'),
                        style: ElevatedButton.styleFrom(backgroundColor: pillButtonColor.withOpacity(0.5)),
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

  void _openPillDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PillEntryDialog();
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
}
