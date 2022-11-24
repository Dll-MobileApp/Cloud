import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final/modelo/lugares_local.dart';

import '../repositorio/boxes.dart';

class DetallesPage extends StatefulWidget {
  const DetallesPage({Key? key}) : super(key: key);

  @override
  State<DetallesPage> createState() => _DetallesPageState();
}

class _DetallesPageState extends State<DetallesPage> {

  void agregarFavoritos(){
    var lugarFavorito = LugaresLocal();
    final box = Boxes.boxFavoritos();
    box.add(lugarFavorito);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle sitio turístico POI'),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 35),
              onPressed: (){
              agregarFavoritos();
              },
              icon: const Icon(FontAwesomeIcons.heart, color: Colors.red,))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: const Text('Nombre POI', style:TextStyle(fontSize: 30, fontStyle: FontStyle.normal),),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              margin: EdgeInsets.all(30),
            ),
            Container(
              child: const Image(image: AssetImage('assets/playa.png'), width: 120, height: 120,),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: const [
                  Text('Ciudad: XXXXXXXX\nDepartamento: XXXXXXX\nTemperatura: XX'
                      '\n\nDescripción: Lorem Ipsum is simply dummy text of the'
                      ' printing and typesetting industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\n'
                      'Otra información de interés.', style: TextStyle(fontSize: 20),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
