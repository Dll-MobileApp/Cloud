//Importar material.dart para quitar errores
import 'package:proyecto_final/pages/home_page.dart';
import 'package:proyecto_final/pages/registrar_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Escribir stful para crear la clase
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email=TextEditingController();
  final password=TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  late final mensaje msg;

  void validarUsuario() async {
    try {
      //if (email.text.isNotEmpty && password.text.isNotEmpty) {
        final user = await auth.signInWithEmailAndPassword(email: email.text, password: password.text);
        if(user != null){
          msg.mostrarMensaje('Bienvenido');
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        }
        /*if (email.text == 'santiagovelas119@gmail.com') {
          if (password.text == '123456') {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
          }else{
            mostrarMensaje('Contraseña incorrecta');
          }
        } else{
          mostrarMensaje('Usuario no registrado');
        }
      }else{
        mostrarMensaje('Por favor ingrese todos los datos');
      }*/
    }on FirebaseAuthException catch (e) {
      //mostrarMensaje('${e.code }');
      if(e.code =='invalid-email'){
        msg.mostrarMensaje('El formato del E-mail no es correcto');
      }
      if(e.code =='user-not-found'){
        msg.mostrarMensaje('El usuario no está registrado');
      }
      if(e.code =='wrong-password'){
        msg.mostrarMensaje('Contraseña incorrecta');
      }
      if(e.code =='unknown'){
        msg.mostrarMensaje('Por favor llene todo los datos');
      }
      if(e.code =='network-request-failed'){
        msg.mostrarMensaje('Sin conexión a internet');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    msg = mensaje(context);
    return Scaffold(
      //backgroundColor: Color(0xFFCCFF90),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: const Image(image: AssetImage('assets/Logo.png'), width: 120, height: 120,),
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black38, width: 4),
                      color: Colors.green),
                ),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      border:  OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email)
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      border:  OutlineInputBorder(),
                      suffixIcon: Icon(Icons.vpn_key_sharp)
                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.green)
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrarPage()));
                    },
                    child: Text('Registrarse')
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 50),
                        shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        shadowColor: Colors.black26,
                        textStyle: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        )
                    ),
                    onPressed: (){
                      validarUsuario();
                    },
                    child: const Text('Ingresar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class mensaje{

  late BuildContext context;

  mensaje(this.context);

  void mostrarMensaje(String mensaje){
    final pantalla = ScaffoldMessenger.of(context);
    pantalla.showSnackBar(
        SnackBar(
          content: Text(mensaje, style: TextStyle(fontSize: 15),),
          backgroundColor: Colors.red,
          duration:  Duration(seconds: 10),
          action: SnackBarAction(
              label: "Registrarse",
              onPressed: () {
                pantalla.hideCurrentSnackBar;
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrarPage()));
              }
          ),
        )
    );
  }

  void MensajeOK(String mensaje){
    final pantalla = ScaffoldMessenger.of(context);
    pantalla.showSnackBar(
        SnackBar(
          content: Text(mensaje, style: TextStyle(fontSize: 15),),
          backgroundColor: Colors.green,
          duration:  Duration(seconds: 10),
        )
    );
  }


}
