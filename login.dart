import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log in page',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _email = 'Email@example.com';
  final String _password = 'password123';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final eInput = _emailController.text;
    final pInput = _passwordController.text;
    if (eInput == _email && pInput == _password) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Successful! Welcome')));
      Future.delayed(Duration(seconds: 5), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoggedIn(email: eInput)));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed, please try again.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.forum,
                color: Colors.blue,
                size: 150,
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

class LoggedIn extends StatelessWidget {
  final String email;
  LoggedIn({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Successfully logged in!'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Welcome: $email'),
      ),
    );
  }
}
