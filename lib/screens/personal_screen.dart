import 'package:flutter/material.dart';
import 'package:pf2/models/Persona.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  String _firstName = ""; 
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
          _createInputLastName(), 
          Divider(),
          _createInputEmailAdress(),
          Divider(),
           _createPassword(),

        ],
      ),
    );
  }

  Widget _createInputFirstName() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Nom',
        labelText: 'Nom',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      onChanged: (valor) {
        setState(() {
          _firstName = valor; 
        });
      },
    ); 
  }

  Widget _createInputLastName() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Cognom',
        labelText: 'Cognom',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      onChanged: (valor) {
        setState(() {
          _lastName = valor; 
        });
      },
    ); 
  }

  Widget _createInputEmailAdress() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email_outlined),
        icon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
      onChanged: (valor) {
        setState(() {
          _emailAdress = valor; 
        });
      },
    ); 
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )     
      ),
      onChanged: (valor){
        
      },
    ); 
  }
}