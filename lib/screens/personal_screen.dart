import 'package:flutter/material.dart';
import 'package:pf2/models/Persona.dart';

class PersonalScreen extends StatefulWidget {
  final Persona persona;
  const PersonalScreen({super.key, required this.persona});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  late String _firstName; 
  late String _lastName ; 
  late String _emailAdress; 
  late String _dateOfBirth;  
  late String _password;

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _inputFieldDataController;

  @override
  void initState() {
    super.initState();
    final p = widget.persona;
    _firstName = p.firstName;
    _lastName = p.lastName;
    _emailAdress = p.emailAdress;
    _password = p.password;
    _dateOfBirth = DateTime.parse(p.dateOfBirth.toString()).toString();

    _firstNameController = TextEditingController(text: p.firstName);
    _lastNameController = TextEditingController(text: p.lastName);
    _emailController = TextEditingController(text: p.emailAdress);
    _inputFieldDataController = TextEditingController(text: p.dateOfBirth.toString());
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _inputFieldDataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.persona.lastName} - Edit Profile'),
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
          _botonGuardar() 
        ],
      ),
    );
  }

  Widget _createInputFirstName() {
    return TextField(
      controller: _firstNameController,
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
      controller: _lastNameController,
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
      controller: _emailController,
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
      controller: TextEditingController(text: _password),
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
        FocusScope.of(context).requestFocus(FocusNode());
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

  Widget _botonGuardar() {
    return ElevatedButton(
      onPressed: () {
        if(mounted){
          Navigator.pop(
            context, 
            Persona(
              firstName: _firstName, 
              lastName: _lastName, 
              emailAdress: _emailAdress, 
              dateOfBirth: DateTime.parse(_dateOfBirth.toString()), 
              password: _password
          )
          );
        }
      }, 
      child: Text('Guardar i tornar')
    ); 
  }
}