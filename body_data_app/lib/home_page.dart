import 'package:flutter/material.dart';
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

class HomePage extends StatelessWidget {
  void _openPoopDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PoopEntryDialog();
      },
    );
  }

  void _navigateToPoopDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PoopDataPage(),
      ),
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

  void _navigateToPillDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PillDataPage(),
      ),
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

  void _navigateToFoodDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodDataPage(),
      ),
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

  void _navigateToMoodDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MoodDataPage(),
      ),
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

  void _navigateToJournalDataPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => JournalDataPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Data'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _openPoopDialog(context),
                    child: Text('💩'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _openPillDialog(context),
                    child: Text('💊'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _openFoodDialog(context),
                    child: Text('🥣'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _openMoodDialog(context),
                    child: Text('🎭'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _openJournalDialog(context),
                    child: Text('📝'),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _navigateToPoopDataPage(context), // Wrap in lambda function
                    child: Text('Poop Data'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _navigateToPillDataPage(context), // Wrap in lambda function
                    child: Text('Pill Data'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _navigateToFoodDataPage(context),
                    child: Text('Food Data'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _navigateToMoodDataPage(context),
                    child: Text('Mood Data'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _navigateToJournalDataPage(context),
                    child: Text('Journal'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
