import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  final List<String> items = List<String>.generate(10, (int index) => 'Item $index');  @override
  final _controller = ExpansibleController(); 

 

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 20),
            expansibleWidget(),
            SizedBox(height: 40),
            Expanded(child: reorderableList()),
          ],
        ),
      )
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

  Widget expansibleWidget(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Expansible(
        controller: _controller,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        expansibleBuilder: (context, header, body, animation) {
          return Column(
            children: [
              header,
              SizeTransition(
                sizeFactor: animation,
                axisAlignment: -1,
                child: body,
              ),
            ],
          );
        },
        headerBuilder:  (context, animation){
          return GestureDetector(
            onTap: () {
              _controller.isExpanded
                  ? _controller.collapse()
                  : _controller.expand();
            },
            child: const ListTile(
              leading: Icon(Icons.list_alt),
              title: Text('Lista expansible'),
              trailing: Icon(Icons.expand_more),
            ),
          );
        },
        bodyBuilder: (context, animation) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.insert_emoticon),
                title: Text('Elemento A')),
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text('Elemento B')),
              ListTile(
                leading: Icon(Icons.baby_changing_station),
                title: Text('Elemento C')),
            ], 
          ),
        )
        
      ) 
    );
    
  }
}
// Expansible widget 
// reorderableList widget