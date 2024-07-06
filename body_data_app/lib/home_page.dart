import 'package:flutter/material.dart';
import 'poop_entry_dialog.dart';
import 'poop_data_page.dart';
import 'pill_entry_dialog.dart';
import 'pill_data_page.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Data'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _openPoopDialog(context),
                  child: Text('💩'),
                ),
                SizedBox(width: 16), // Add spacing between buttons
                ElevatedButton(
                  onPressed: () => _navigateToPoopDataPage(context), // Wrap in lambda function
                  child: Text('Data'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _openPillDialog(context),
                  child: Text('💊'),
                ),
                SizedBox(width: 16), // Add spacing between buttons
                ElevatedButton(
                  onPressed: () => _navigateToPillDataPage(context), // Wrap in lambda function
                  child: Text('Data'),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
