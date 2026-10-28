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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DevProfile M3'),
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
            title: Text('${Persona.defaults().firstName} ${Persona.defaults().lastName} \n ${Persona.defaults().emailAdress} \n ${Persona.defaults().dateOfBirth}'),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PersonalScreen())
              );
              setState(() {
                
              });
            }, 
            child: Text('Edit Profile')
          ), 
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WidgetScreen(),)
              );
              setState(() {
                // espera resposta de witget screen 
              });
            }, 
            child: Text('Explore Witget Showcase')
          )
        ],
      ),
    ); 
  }
}