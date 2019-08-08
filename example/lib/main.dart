import 'package:flutter/material.dart';
import 'package:vrview/vrview.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  VrController vrController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Vrview vr = new Vrview(
      onVrCreated: onVrCreated,
    );

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Container(
            child: vr,
            height: 300.0,
          )),
    );
  }

  void onVrCreated(vrController) async {
    this.vrController = vrController;
    this.vrController.loadUrl("https://b.imge.to/2019/07/17/LmEy0.jpg");
  }
}