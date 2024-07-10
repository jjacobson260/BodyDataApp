import 'package:flutter/material.dart';
import 'database_helper.dart';

class PoopStatsWidget extends StatefulWidget {
  @override
  _PoopStatsWidgetState createState() => _PoopStatsWidgetState();
}

class _PoopStatsWidgetState extends State<PoopStatsWidget> {
  double bristolAverage24h = 0.0;
  double bristolAverage7d = 0.0;
  double bristolPercentDifference = 0.0;
  double urgencyAverage24h = 0.0;
  double urgencyAverage7d = 0.0;
  double urgencyPercentDifference = 0.0;
  int bmCount24h = 0;
  int bmCount7d = 0;
  double bmCountPercentDifference = 0.0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAverages();
  }

  double calculatePercentDifference(double average1, double average2) {
    if (average2 == 0) {
      return 0.0; // Avoid division by zero
    }
    return ((average1 - average2) / average2) * 100;
  }

  Future<void> _fetchAverages() async {
    final dbHelper = DatabaseHelper();
    final bristolavg24h = await dbHelper.getAverageBristolRatingForDays(1);
    final bristolavg7d = await dbHelper.getAverageBristolRatingForDays(7);
    final urgencyavg24h = await dbHelper.getAverageUrgencyForDays(1);
    final urgencyavg7d = await dbHelper.getAverageUrgencyForDays(7);
    final bmcnt24h = await dbHelper.getBMCountForDays(1);
    final bmcnt7d = await dbHelper.getBMCountForDays(7);

    setState(() {
      bristolAverage24h = bristolavg24h;
      bristolAverage7d = bristolavg7d;
      bristolPercentDifference = calculatePercentDifference(bristolAverage24h, bristolAverage7d);
      urgencyAverage24h = urgencyavg24h;
      urgencyAverage7d = urgencyavg7d;
      urgencyPercentDifference = calculatePercentDifference(urgencyAverage24h, urgencyAverage7d);
      bmCount24h = bmcnt24h;
      bmCount7d = bmcnt7d;
      bmCountPercentDifference = calculatePercentDifference(bmCount24h / 1.0, bmCount7d / 7.0);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: Text('24hr Quick Stats')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn(
                        'Bristol Rating',
                        bristolAverage24h,
                        bristolPercentDifference,
                      ),
                      _buildStatColumn(
                        'Avg Urgency',
                        urgencyAverage24h,
                        urgencyPercentDifference,
                      ),
                      _buildStatColumn(
                        'BM Count',
                        bmCount24h / 1.0,
                        bmCountPercentDifference,
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildStatColumn(String title, double average, double percentDifference) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        Text(
          average.toStringAsFixed(2),
          style: TextStyle(fontSize: 24),
        ),
        Text(
          '${percentDifference.toStringAsFixed(2)}%',
          style: TextStyle(
            color: percentDifference < 0 ? Colors.green : Colors.red,
          ),
        ),
        Text('vs past week'),
      ],
    );
  }
}
