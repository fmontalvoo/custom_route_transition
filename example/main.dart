import 'package:flutter/material.dart';

import 'package:custom_route_transition_test/custom_route_transition_test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter custom route transition',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'one',
      routes: {
        'one': (context) => PageOne(),
        'two': (context) => PageTwo(),
      },
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PÃ¡gina 1'),
      ),
      body: Center(
        child: MaterialButton(
          child: Text('Ir a pÃ¡gina 2'),
          color: Colors.blueGrey,
          onPressed: () {
            RouteTransition(
              context,
              child: PageTwo(),
              type: AnimationType.fadeIn,
              replacement: true,
              duration: Duration(milliseconds: 700),
            );
          },
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PÃ¡gina 2'),
      ),
      body: Center(
        child: Text('PÃ¡gina 2'),
      ),
    );
  }
}
