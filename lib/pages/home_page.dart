import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/pages/datelles_page.dart';
import 'package:proyecto_final/pages/menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sitios turísticos'),
      ),
      drawer: Menu_page(),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) =>  Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/playa.png'),
                  ),
                  title: Text('Three-line item'),
                  subtitle: const Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetallesPage()));
                  },
                ),
              ),
      ),
      bottomNavigationBar: const MenuInferior(),
    );
  }
}
