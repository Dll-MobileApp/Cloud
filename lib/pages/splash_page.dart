import 'package:proyecto_final/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void initState(){
    pasarPage();
    super.initState();
  }

  Future<void> pasarPage() async{
    Future.delayed(Duration(seconds: 3), () async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Image(image: AssetImage('assets/Logo.png'), width: 100, height: 100,),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.black38, width: 4),
              color: Colors.green),
        ),
      ),
    );
  }
}
