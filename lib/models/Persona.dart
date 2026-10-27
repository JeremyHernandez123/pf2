class Persona {
  String firstName; 
  String lastName;
  String emailAdress; 
  String password; 
  DateTime dateOfBirth;

  Persona({
    required this.firstName,
    required this.lastName,
    required this.emailAdress,
    required this.password,
    required this.dateOfBirth,
  });

  factory Persona.defaults(){
    return Persona(
      firstName: 'Jeremy',
      lastName: 'Hernandez fraga',
      emailAdress: 'jeremy@gmail.com', 
      password: '123456',
      dateOfBirth: DateTime(2006, 09, 12),
    );
  }

  get fullName => '$firstName $lastName';
  get formattedDateOfBirth => '${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}';

}