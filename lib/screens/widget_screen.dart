import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
 final List<String> items = List<String>.generate(10, (int index) => 'Item $index');  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Screen'),
      ),
      body:  reorderableList(),
    );
  }

  Widget reorderableList() {
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
       child: Text('Llista d\items'),
      ),
      children: [
        for (int i = 0; i < items.length; i++)
          ListTile(

            key: ValueKey(items[i]),
            title: Text(items[i]),
            leading: Icon(Icons.people),
            trailing: Icon(Icons.list)
          ),
      ],
    ); 
  }
}



// Expansible widget 
// reorderableList widget