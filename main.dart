import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const myApp());

class myApp extends StatelessWidget {
  const myApp({Key key}) : super(key: key);

  static const String _title = 'Reminder';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: const stfulwidget(),
      ),
    );
  }
}

class stfulwidget extends StatefulWidget {
  const stfulwidget({Key key}) : super(key: key);

  @override
  _stfulwidgetState createState() => _stfulwidgetState();
}

class _stfulwidgetState extends State<stfulwidget> {
  final List _items = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
/*
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.15);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.05);
*/

    return ReorderableListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          for (int i = 0; i < _items.length; i++)
            Card(
              key: Key('$i'),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Item: $i',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('This is the item number $i',
                          style: TextStyle(fontSize: 12)),
                      Padding(padding: EdgeInsets.only(bottom: 20, right: 260))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Text(
                                '4:20 PM',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 12),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        });
  }
}
