import 'package:proyecto_final/modelo/usuario_modelo.dart';
import 'package:proyecto_final/pages/login_page.dart';
import 'package:proyecto_final/repositorio/usuarioregistrar.dart';
import 'package:flutter/material.dart';


class RegistrarPage extends StatefulWidget {
  const RegistrarPage({Key? key}) : super(key: key);

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final confpassword = TextEditingController();
  Usuario_registrar usuario = Usuario_registrar();
  late mensaje msg;


  void guardarUsuario(Usuario usuNew) async{
    var resultado = await usuario.registrarUsuario(email.text, password.text);
    usuNew.id = resultado;
    if(resultado =='invalid-email'){
      msg.mostrarMensaje('El formato del E-mail no es correcto');
    }
    if(resultado =='weak-password'){
      msg.mostrarMensaje('La contraseña debe tener mas de 6 caracteres');
    }
    if(resultado =='unknown'){
      msg.mostrarMensaje('Por favor llene todo los datos');
    }
    if(resultado =='network-request-failed'){
      msg.mostrarMensaje('Sin conexión a internet');
    }else{
      usuNew.id = resultado;
      registrarUsuario(usuNew);
      msg.MensajeOK('Usuario registrado con éxito.');
    }
  }

  void registrarUsuario(Usuario usuNew) async{
    var id= await usuario.crearUsuario(usuNew);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
  }

  void traerDatos(){
    setState(() {
      if(password.text == confpassword.text){
        if(email.text.isNotEmpty && password.text.isNotEmpty && confpassword.text.isNotEmpty){
          var usuNew = Usuario('', email.text, password.text);
          guardarUsuario(usuNew);
        }else{
          msg.mostrarMensaje('Por favor llene todos los datos');
        }
      }else{
        msg.mostrarMensaje('Las contraseñas no coinciden.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    msg = mensaje(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/fondo.png'),
              fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:  50, horizontal: 50),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    child: const Image(image: AssetImage('assets/Logo.png'), width: 120, height: 120,),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black38, width: 4),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment(0.0, 1.0),
                        colors: <Color>[
                          Color(0xff76ff03),
                          Color(0xff00b8d4),
                        ],
                        tileMode: TileMode.repeated,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.email_outlined)
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    controller: password,
                    keyboardType: TextInputType.name,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.vpn_key_sharp)
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: confpassword,
                    keyboardType: TextInputType.name,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'Confirmar Password',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.vpn_key_sharp)
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black12,
                          fixedSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          textStyle: const TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 20)),
                      onPressed: (){
                        traerDatos();
                      },
                      child: const Text('Registrarse')
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
