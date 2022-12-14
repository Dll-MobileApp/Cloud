import 'package:proyecto_final/pages/login_page.dart';
import 'package:flutter/material.dart';

enum Genero{Femenino, Masculino}

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({Key? key}) : super(key: key);

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final confpassword = TextEditingController();

  Genero? genero = Genero.Masculino;

  void guardarUsuario() async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {

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
                  SizedBox(
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
                        guardarUsuario();
                      },
                      child: const Text('Registrarse')
                  ),
                  SizedBox(
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
