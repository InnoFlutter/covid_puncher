import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:covid_puncher/utils.dart';

class CovidPuncherLoader extends StatefulWidget {
  CovidPuncherLoader({Key? key}) : super(key: key);

  @override
  State<CovidPuncherLoader> createState() => _CovidPuncherLoaderState();
}

class _CovidPuncherLoaderState extends State<CovidPuncherLoader> {
  static final countMatrix = 3;
  static final double size = 92;
  final _random = new Random();
  late List<List<String>> matrix;
  int counter = 0;

  int next(int min, int max) => min + _random.nextInt(max - min);

  @override
  void initState() {
    super.initState();

    setEmptyFields();

    Timer.periodic(Duration(seconds: 1), (Timer t) {
      int x = next(0, countMatrix);
      int y = next(0, countMatrix);

      showCoronaIcon(x, y);

      Future.delayed(Duration(milliseconds: 800)).then((_) {
        setState(() {
          removeCoronaIcon(x, y);
        });
      });
    });
  }

  void setEmptyFields() => setState(() {
        matrix = List.generate((countMatrix),
            (_) => List.generate(countMatrix, (_) => Cell.EMPTY));
      });

  void showCoronaIcon(int x, int y) {
    setState(() {
      matrix[x][y] = Cell.CORONA;
    });
  }

  void removeCoronaIcon(int x, int y) {
    setState(() {
      matrix[x][y] = Cell.EMPTY;
    });
  }

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  void punchIt(int x, int y) {
    increaseCounter();
    removeCoronaIcon(x, y);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("We are loading your data. Have some fun for now",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'KdamThmorPro')),
          const Text("COVID PUNCHER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'KdamThmorPro')),
          Text("Total: $counter",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'KdamThmorPro')),
          Column(
              children: Utils.modelBuilder(
                  (matrix), (index, value) => buildRow(index)))
        ]));
  }

  Widget buildRow(int x) {
    final values = matrix[x];

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Utils.modelBuilder(values, (y, value) => buildField(x, y)));
  }

  Widget buildField(int x, int y) {
    final value = matrix[x][y];

    return Container(
        padding: EdgeInsets.only(top: 16),
        margin: EdgeInsets.all(16.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(size, size), primary: Colors.white),
            onPressed: () {
              if (value == Cell.CORONA) {
                punchIt(x, y);
              }
            },
            child: value == Cell.CORONA
                ? Icon(Icons.coronavirus, color: Colors.green, size: 48)
                : Text(Cell.EMPTY)));
  }
}

class Cell {
  static const EMPTY = '';
  static const CORONA = 'C';
}
