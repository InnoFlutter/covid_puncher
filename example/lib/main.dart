import 'package:flutter/material.dart';
import 'dart:async';

import 'package:covid_puncher/covid_puncher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = false;

  loadInformation() {
    setState(() {
      isLoading = true;

      // Make a 10-seconds delay to mock real data loading
      Future.delayed(Duration(seconds: 10)).then((_) {
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          // Display loader depending on isLoading property
          child: isLoading ? CovidPuncherLoader() : ElevatedButton(
            onPressed: (){
              // Load mock data
              loadInformation();
            },
            child: Text("Load a lot of information")
          )
        ),
      ),
    );
  }
}
