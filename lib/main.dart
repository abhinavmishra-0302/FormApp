import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intership/screens/details_screen.dart';
import 'package:intership/screens/form_screen.dart';
import 'package:intership/screens/read_screen.dart';
import 'package:intership/services/sqlite_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/info_details": (context) => DetailsScreen(),
      },
    );
  }
}

class _MyHomePage extends StatefulWidget {
  _MyHomePage() {
    SQLiteService sqLiteService = SQLiteService();
    sqLiteService.initializeDB();
  }

  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
        () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
            return FormPage();
          }));
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FlutterLogo(size: MediaQuery.of(context).size.height,),
    );
  }
}

class FormPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Page"),),
      body: FormScreen(),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: Colors.lightBlue,
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
            ),
            ListTile(
              title: const Text("Read leads"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (_){
                  return ReadScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
