class Usuario{
  var _id;
  var _email;
  var _password;

  //Constructor
  Usuario(this._id, this._email, this._password);

  Usuario.fromJson(Map<String, dynamic> data)
  : _id = data['id'],
    _email = data['email'],
    _password = data['password'];

  Map<String, dynamic> convertir()=>{
    'id': _id,
    'email': _email,
    'contraseña': _password
  };

  //Getters
  get password => _password;

  get email => _email;

  get id => _id;

  //Setters
  set password(value) {
    _password = value;
  }

  set email(value) {
    _email = value;
  }

  set id(value) {
    _id = value;
  }
}