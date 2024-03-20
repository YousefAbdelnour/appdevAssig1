import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Booking',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: HotelBookingPage(),
    );
  }
}

class HotelBookingPage extends StatefulWidget {
  @override
  _HotelBookingPageState createState() => _HotelBookingPageState();
}

class _HotelBookingPageState extends State<HotelBookingPage> {
  int _numberOfGuests = 2;
  int _numberOfRooms = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back_ios_new, size: 22.0),
                Text("Home",
                    style: TextStyle(fontSize: 12.0, color: Colors.white)),
              ],
            ),
          ),
        ),
        title: Text('Hotels'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Las Vegas, NV'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('$_numberOfGuests Guests'),
            trailing: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      _numberOfGuests =
                          (_numberOfGuests > 1) ? _numberOfGuests - 1 : 1;
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.remove, color: Colors.yellow),
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: VerticalDivider(color: Colors.yellow),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _numberOfGuests++;
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.add, color: Colors.yellow),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.bed),
            title: Text('$_numberOfRooms Room'),
            trailing: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      _numberOfRooms =
                          (_numberOfRooms > 1) ? _numberOfRooms - 1 : 1;
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.remove, color: Colors.yellow),
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: VerticalDivider(color: Colors.yellow),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _numberOfRooms++;
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.add, color: Colors.yellow),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Today'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Tomorrow'),
            trailing: Icon(Icons.chevron_right),
          ),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'You are trying to book $_numberOfGuests guests and $_numberOfRooms rooms.'),
                  duration: Duration(seconds: 2),
                ),
              ),
              child: Text('Reserve', style: TextStyle(fontSize: 20)),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationScreen(
                      numberOfGuests: _numberOfGuests,
                      numberOfRooms: _numberOfRooms,
                    ),
                  ),
                );
              },
              child: Text('Book Hotels', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmationScreen extends StatelessWidget {
  final int numberOfGuests;
  final int numberOfRooms;

  const ConfirmationScreen({
    Key? key,
    required this.numberOfGuests,
    required this.numberOfRooms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You booked $numberOfGuests guests and $numberOfRooms rooms.'),
            Text('Thanks'),
          ],
        ),
      ),
    );
  }
}
