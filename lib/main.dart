import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blueGrey.shade400,
          appBar: AppBar(
            backgroundColor: Colors.blueGrey.shade700,
            title: const Text('Magic 8 ball'),
            centerTitle: true,
          ),
          body: const ProjectApp(),
        ),
      ),
    );

class ProjectApp extends StatefulWidget {
  const ProjectApp({Key? key}) : super(key: key);

  @override
  State<ProjectApp> createState() => _ProjectAppState();
}

class _ProjectAppState extends State<ProjectApp> {
  int face = 1;

  change() {
    int value = Random().nextInt(5) + 1;

    // To ensure two images are not displayed in a row
    while (value == face) {
      value = Random().nextInt(5) + 1;
    }
    face = value;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  setState(
                    () {
                      change();
                    },
                  );
                },
                child: Image.asset('images/ball$face.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
