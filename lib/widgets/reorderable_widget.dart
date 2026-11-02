import 'package:flutter/material.dart';

class ReorderableWidget extends StatefulWidget {
  const ReorderableWidget({super.key});

  @override
  State<ReorderableWidget> createState() => _ReorderableWidgetState();
}

class _ReorderableWidgetState extends State<ReorderableWidget> {
  final List<String> items = List<String>.generate(10, (int index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final String item = items.removeAt(oldIndex);
          items.insert(newIndex, item);
        });
      },
      header: Center(
        child: Text('Llista d\'items'),
      ),
      children: [
        for (int i = 0; i < items.length; i++)
          ListTile(
            key: ValueKey(items[i]),
            title: Text(items[i]),
            leading: Icon(Icons.people),
            trailing: ReorderableDragStartListener(
              index: i,
              child: const Icon(Icons.list),
            ),
          ),  
      ],
    ); 
  }
}