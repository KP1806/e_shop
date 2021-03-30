import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_shop/compte.dart';
import 'package:e_shop/infos.dart';
import 'package:e_shop/panier.dart';
import 'package:e_shop/class.dart';
import 'package:e_shop/homePage.dart';


/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  runApp(MyApp());
}*/

void main(){
  runApp(MyApp());
}





class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => MyHomePage(title: "Shopping", listPanier: [], infos: InfosCompte("Povoa", "Killyan", "Killyan18", "kpovoa@numericable.fr", "azerty", "18/06/2000" ),),
        '/SecondPage': (context) => Panier(),
        '/ThirdPage': (context) => Compte(),
        '/FourthPage': (context) => Informations(),
      },
      initialRoute: '/'
    );
  }
}


