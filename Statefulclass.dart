import 'package:flutter/material.dart';

class StatefulWidgetReorderable extends StatefulWidget {
  const StatefulWidgetReorderable({Key key}) : super(key: key);

  @override
  _StatefulWidgetReorderableState createState() =>
      _StatefulWidgetReorderableState();
}

class _StatefulWidgetReorderableState extends State<StatefulWidgetReorderable> {
  final List _items = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {


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
                            borderRadius: BorderRadius.circular(10)),
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
