import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traveller app',
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [HomePage(), SearchPage(), SettingsPage()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traveller's guide"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Images/homePic.jpg'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 15, left: 25, right: 25),
                child: Text(
                  'The Best Travel in the world',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                )),
            Padding(
                padding: EdgeInsets.only(bottom: 55, left: 25, right: 25),
                child: Text(
                  'Live without limits. The world is made to be explored and appreciate its beauty',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(bottom: 5, left: 25, right: 25),
              child: Container(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    // Define what happens when the button is pressed
                  },
                  child: Text('Explore Now'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Map<String, String>> gridItems = [
    {'label': 'Carte', 'image': 'Images/carte.jpg'},
    {'label': 'QRCode', 'image': 'Images/qrcode.jpg'},
    {'label': 'Météo', 'image': 'Images/meteo.jpg'},
    {'label': 'City Guides', 'image': 'Images/cityguides.jpg'},
    {'label': 'Marche', 'image': 'Images/marche.jpg'},
    {'label': 'VTT', 'image': 'Images/vtt.jpg'},
    {'label': 'Vélo', 'image': 'Images/velo.jpg'},
    {'label': 'Cheval', 'image': 'Images/cheval.jpg'},
    {'label': 'Auto / Moto', 'image': 'Images/auto.jpg'},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 50,
            mainAxisSpacing: 50,
            childAspectRatio: 1),
        itemCount: gridItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(gridItems[index]['image']!),
                radius: 30,
              ),
              Text(
                gridItems[index]['label']!,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _controller = TextEditingController();
  String _result = '';
  void _convertFahrenheitToCelsius() {
    final inputFahrenheit = double.tryParse(_controller.text);
    if (inputFahrenheit != null) {
      final outputCelsius = (inputFahrenheit - 32) * 5 / 9;
      setState(() {
        _result = '${outputCelsius.toStringAsFixed(2)} °C';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_result),
            duration: Duration(seconds: 3),
          ),
        );
      });
    } else {
      setState(() {
        _result = 'Invalid input!';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_result),
            duration: Duration(seconds: 3),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Enter temperature in Fahrenheit',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _convertFahrenheitToCelsius,
            child: Text('Convert to Celsius'),
          ),
        ],
      ),
    );
  }
}
