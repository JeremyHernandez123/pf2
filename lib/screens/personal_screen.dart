import 'package:flutter/material.dart';
import 'package:pf2/models/Persona.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Persona.defaults().lastName} - Edit Profile'),
      ),
    );
  }
}