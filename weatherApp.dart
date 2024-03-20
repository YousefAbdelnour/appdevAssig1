import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final boxesData = [
    {
      'topText': 'Sun, 8 PM',
      'icon': Icons.wb_sunny,
      'bottomText': '31°',
    },
    {
      'topText': 'Sun, 11 PM',
      'icon': Icons.nightlight_round,
      'bottomText': '30°',
    },
    {
      'topText': 'Mon, 2 AM',
      'icon': Icons.cloud,
      'bottomText': '29°',
    },
    {
      'topText': 'Mon, 5 AM',
      'icon': Icons.cloud_queue,
      'bottomText': '28°',
    },
  ];
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formatDateTime(now);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(formattedDate, style: TextStyle(fontSize: 18)),
          leading: Icon(Icons.refresh, size: 24),
          // Correctly using actions with Padding around icons
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20), // Adjust padding as needed
              child: Icon(Icons.search, size: 24),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20), // Adjust padding as needed
              child: Icon(Icons.menu, size: 24),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Miami',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Few Clouds',
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20),
              ),
              Icon(
                Icons.cloud_queue,
                size: 100,
              ),
              Text(
                '32°',
                style: TextStyle(fontSize: 70),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Boxes(up: 'max', down: '34°', showRightDivider: true),
                  Boxes(up: 'min', down: '30°', showRightDivider: false),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: boxesData.map((data) {
                  return Expanded(
                    child: IconBoxes(
                      topText: data['topText'] as String,
                      icon: data['icon'] as IconData,
                      bottomText: data['bottomText'] as String,
                    ),
                  );
                }).toList(),
              ),
              Divider(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Boxes(
                      up: 'wind speed',
                      down: '6 km/h',
                      showRightDivider: true,
                    ),
                    Boxes(
                      up: 'sunrise',
                      down: '6:34 AM',
                      showRightDivider: true,
                    ),
                    Boxes(
                      up: 'sunset',
                      down: '8:16 PM',
                      showRightDivider: true,
                    ),
                    Boxes(
                      up: 'humidity',
                      down: '70%',
                      showRightDivider: false, // Last element, no right divider
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    String dayOfWeek = days[dateTime.weekday - 1];
    String month = months[dateTime.month - 1];
    int day = dateTime.day;
    int year = dateTime.year;

    return '$dayOfWeek, $day $month $year';
  }
}

class Boxes extends StatelessWidget {
  final String up;
  final String down;
  final bool showRightDivider;

  Boxes({
    Key? key,
    required this.up,
    required this.down,
    required this.showRightDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 2), // Padding around the whole container
      decoration: BoxDecoration(
        border: showRightDivider
            ? Border(right: BorderSide(color: Colors.grey, width: 1))
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: 15,
                left: 15), // Padding between the upper text and the lower text
            child: Column(
              children: [
                Text(up,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Text(down, style: TextStyle(fontSize: 16))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconBoxes extends StatelessWidget {
  final String topText;
  final IconData icon;
  final String bottomText;

  IconBoxes({
    Key? key,
    required this.topText,
    required this.icon,
    required this.bottomText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Icon(
            icon,
            size: 24, // Adjust the size as needed
          ),
          Text(
            bottomText,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
