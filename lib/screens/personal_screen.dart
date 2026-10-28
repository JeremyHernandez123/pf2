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
  String _password = "";
  final TextEditingController _inputFieldDataController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Persona.defaults().lastName} - Edit Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 200),
        children: [
          _createInputFirstName(), 
          Divider(),
          _createInputLastName(), 
          Divider(),
          _createInputEmailAdress(),
          Divider(),
           _createPassword(),
          Divider(),
          _createDateOfBirth(),
          Divider(),
          SizedBox( height: 20),
          ElevatedButton(
            onPressed: () {
              if(mounted){
                Navigator.pop(
                  context, 
                  Persona(
                    firstName: _firstName, 
                    lastName: _lastName, 
                    emailAdress: _emailAdress, 
                    password: _password,
                    dateOfBirth: DateTime.parse(_dateOfBirth.toString())
                ));
              }
            }, 
            child: Text('Guardar i tornar')
          )
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
        setState(() {
          _password = valor; 
        });
      },
    ); 
  }

  Widget _createDateOfBirth() {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDataController,
      decoration: InputDecoration(
        hintText: 'Data naixement', 
        labelText: 'Data naixement',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ) 
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _seleccionaData(context); 
      },
    ); 
  }

  void _seleccionaData(BuildContext context) async {

    DateTime? picked = await showDatePicker(
      context: context, 
      // locale: Locale('es', 'Es'),
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030)
      ); 

      if(picked != null ){
        setState(() {
          _dateOfBirth = picked.toString(); 
          _inputFieldDataController.text = _dateOfBirth; 
        });
      }
  }
}