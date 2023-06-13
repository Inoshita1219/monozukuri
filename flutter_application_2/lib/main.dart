import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _size = 300;

  _changeSize(double diff) {
    setState(() {
      _size += diff;
      if (_size < 10) _size = 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.airline_seat_recline_extra_outlined),
            Image.network(
                'https://www.oit.ac.jp/laboratory/img/educator/educator_image136.jpg'),
            FlutterLogo(
              curve: Curves.bounceInOut,
              style: FlutterLogoStyle.stacked,
              duration: const Duration(milliseconds: 100),
              size: _size,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          _changeSize(100);
                        },
                        child: const Text('領収書'))),
                Container(
                    margin: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          _changeSize(-100);
                        },
                        child: const Text('レシート'))),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _size = 300;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.microwave),
      ),
    );
  }
}
