import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'This is what text looks like',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bret',
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                  Text(
                    'Sincere@april.biz',
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                  Text(
                    '1-770-736-8031 x56442',
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'address',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Romanguera-Crona, Multi-layered   client-server',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'neural-net, harness real-time e-markets',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'company',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Romanguera-Crona, Multi-layered   client-server',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'neural-net, harness real-time e-markets',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
          Image.asset(
            'image/image1.jpeg',
            height: 340,
          ),
        ],
      ),
    );
  }
}
