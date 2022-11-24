import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_final/pages/fav_page.dart';
import 'package:proyecto_final/pages/home_page.dart';
import 'package:proyecto_final/pages/login_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu_page extends StatelessWidget {
  //const Menu_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue
            ),
              child: Image.network('https://cdn-icons-png.flaticon.com/512/6073/6073873.png')
          ),
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.person_pin, size: 20, color: Colors.blue,),
                title: Text((FirebaseAuth.instance.currentUser?.email).toString()),
                textColor: Colors.blue,
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app, size: 20, color: Colors.blue,),
                title: Text('Salir'),
                textColor: Colors.blue,
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class MenuInferior extends StatelessWidget {
  const MenuInferior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart),
          label: 'Favoritos'),
          BottomNavigationBarItem(
              icon:Icon(FontAwesomeIcons.person),
          label: 'Perfil'),
          BottomNavigationBarItem(
              icon:Icon(FontAwesomeIcons.toolbox),
          label: 'Opciones'),
        ],
      onTap: (indice){
          if(indice==0){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const FavPage()));
          }
      },
    );
  }
}
