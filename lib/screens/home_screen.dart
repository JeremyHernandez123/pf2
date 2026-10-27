import 'package:flutter/material.dart';
import 'package:pf2/models/Persona.dart';
import 'package:pf2/screens/personal_screen.dart';

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
        child: Text('Profile Card: ${Persona.defaults().firstName} ${Persona.defaults().lastName} \n ${Persona.defaults().emailAdress} \n ${Persona.defaults().formattedDateOfBirth}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.edit),
            Text('Edit profile'),
          ],
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PersonalScreen()),
          );
        },
      ),
    );
  }
}