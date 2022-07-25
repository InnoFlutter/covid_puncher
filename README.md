# covid_puncher

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)

An interactive loader which can be shown instead of boring spinners

## Getting Started

This mini game-loader will make your users more excited during long-waiting procedures.

Just show or hide the game as shown in the examples.

## Usage

Here is a simple use case where the `CovidPuncherLoader` is shown only when the data is loading

```
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: isLoading ? CovidPuncherLoader() : ElevatedButton(
            onPressed: (){
              loadInformation();
            },
            child: Text("Load a lot of information")
          )
        ),
      ),
    );
  }
```
