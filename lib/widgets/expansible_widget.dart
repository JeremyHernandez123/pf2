import 'package:flutter/material.dart';

class ExpansibleWidget extends StatefulWidget {
  const ExpansibleWidget({super.key});

  @override
  State<ExpansibleWidget> createState() => _ExpansibleWidgetState();
}

class _ExpansibleWidgetState extends State<ExpansibleWidget> {
  final _controller = ExpansibleController();

  @override
  Widget build(BuildContext context) {
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