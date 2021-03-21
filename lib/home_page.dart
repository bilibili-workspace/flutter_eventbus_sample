import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eventbus_sample/event_bus.dart';

import 'http_error_event.dart';
import 'http_error_listener.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements HttpErrorListener {
  int _counter = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _incrementCounter() {
    eventBus.fire(HttpErrorEvent(404, "找不到网页"));
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
        'flutter event bus sample',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
