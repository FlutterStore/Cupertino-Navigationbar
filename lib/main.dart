import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Sky { midnight, viridian, cerulean }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.midnight: const Color(0xff191970),
  Sky.viridian: const Color(0xff40826d),
  Sky.cerulean: const Color(0xff007ba7),
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Sky _selectedSegment = Sky.midnight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CupertinoNavigationBar",style: TextStyle(fontSize: 15),),
      ),
      backgroundColor: skyColors[_selectedSegment],
      body: Column(
        children: [
           Padding(
             padding: const EdgeInsets.only(top: 10),
             child: CupertinoSlidingSegmentedControl<Sky>(
              // padding: EdgeInsets.all(0),
                backgroundColor: CupertinoColors.systemGrey2,
                thumbColor: skyColors[_selectedSegment]!,
                groupValue: _selectedSegment,
                onValueChanged: (Sky? value) {
                  if (value != null) {
                    setState(() {
                      _selectedSegment = value;
                    });
                  }
                },
                children: const <Sky, Widget>{
                  Sky.midnight :Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Home 1',
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  ),
                  Sky.viridian: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Home 2',
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  ),
                  Sky.cerulean: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Home 3',
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  ),
                },
              ),
           ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height/1.21,
            width: MediaQuery.of(context).size.width,
            color: skyColors[_selectedSegment],
            child: Text(
              _selectedSegment.name == 'midnight' ? 'Home 1' :_selectedSegment.name == 'viridian' ?  'Home 2'  : 'Home 3',
              style: const TextStyle(fontSize: 30,color: Colors.white),
            ),
          ),
        ],
      ),    );
  }
}




