import 'package:flutter/material.dart';
import './signIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			theme: ThemeData.dark(),
      home: SignIn(),
			debugShowCheckedModeBanner: false,
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
        title: Text('LinkedIn Authentication'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('LinkedIn'),
          onPressed: () {
            print('LinkedIn Login');
          },
        ),
      ),
    );
  }
}
