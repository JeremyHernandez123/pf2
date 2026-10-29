import 'package:flutter/material.dart';
import 'package:pf2/models/Persona.dart';
import 'package:pf2/screens/personal_screen.dart';
import 'package:pf2/screens/widget_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Persona _persona = Persona.defaults();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('DevProfile M3'),
        ),
      ),
      body: Center(
        child: _profileCard(context),
      ),
    );  
  }

  @override
  Widget _profileCard(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              '${_persona.firstName} ${_persona.lastName} '
              '\n ${_persona.emailAdress} '
              '\n ${_persona.dateOfBirth}'
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push<Persona>(
                context,
                MaterialPageRoute( builder: (context) => PersonalScreen(persona: _persona),)
              );
              if (result != null) {
                setState(() {
                  _persona = result;
                });
              }
              
            }, 
            child: Text('Edit Profile')
          ), 
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WidgetScreen(),)
              );
              setState(() {
                
              });
            }, 
            child: Text('Explore Witget Showcase')
          )
        ],
      ),
    ); 
  }
}