import 'package:flutter/material.dart';
import 'package:pf2/models/Persona.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  String _firstname = ""; 
  String _lastName = ""; 
  String _emailAdress = "" ; 
  String _dateOfBirth = "";  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Persona.defaults().lastName} - Edit Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _createInputFirstName(), 
          Divider(),

        ],
      ),
    );
  }

  Widget _createInputFirstName() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Nom de l\'usuari',
        labelText: 'Nom',
        helperText: 'Posa el teu nom',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
    ); 
  }
}