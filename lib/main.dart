import 'package:flutter/material.dart';
import 'package:flutter_flashlight/flutter_flashlight.dart';
import 'package:torch_controller/torch_controller.dart';

void main(

    ) => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TorchController();

  bool _hasFlashlight = false;

  @override
  initState() {
    super.initState();
    initFlashlight();
  }

  initFlashlight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mr.Tech_flash_light'),
        ),
        body: Center(
            child: Column(
          children: <Widget>[

            SizedBox(height: 50),
            CircleAvatar(radius: 70,backgroundImage:AssetImage("images/pp.jpg") ,),
            SizedBox(height: 20),
            Text(_hasFlashlight
                ? 'MR.TECH'
                : '',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height: 5),
            Text("Connecting You",style: TextStyle(fontSize: 9),),
            SizedBox(height: 120),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 12),
                  RaisedButton(
                    child: Text('Turn on'),
                    onPressed: () => Flashlight.lightOn(),
                  ),
                  Container(
                    height: 150,
                    width: 105,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage("images/asd.jpg"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  RaisedButton(
                    child: Text('Turn off'),
                    onPressed: () => Flashlight.lightOff(),
                  ),

                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}


