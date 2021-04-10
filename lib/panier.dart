import 'package:flutter/material.dart';
import 'package:e_shop/class.dart';

class Panier extends StatefulWidget {
  /*Panier({Key key,this.listPanier}) : super(key: key);
  final List<Article> listPanier;*/


  @override
  _PanierState createState() => _PanierState();
}




class _PanierState extends State<Panier> {
  SharedPrefs sharedPref = SharedPrefs();

  @override
  Widget build(BuildContext context) {
    final Arguments arg = ModalRoute.of(context).settings.arguments;
    List<Article> listPanier = arg.list;
    int nbArticles = arg.nbArticles;
    double total = 0;
    for (var i in listPanier) total = total + i.prix;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {

              });
            },
            icon: Icon(Icons.arrow_back_sharp,)),
        title: Text("Votre Panier"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/ThirdPage', arguments: new Arguments(listPanier, arg.infos, nbArticles));
            },
            icon: Icon(Icons.account_circle,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            if (listPanier.length == 0)
              Text("Vous n'avez pas ajouté d'article à votre panier",
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,),
            for (var k in listPanier) _buildRow(k),
            if (listPanier.length != 0)
              Container(
                width: 400.0,
                height: 0.5,
                decoration: BoxDecoration(color: Colors.black,),
              ),
            if (listPanier.length != 0)
              ListTile(
                leading: Text("Total", style: TextStyle(fontSize: 18.0),),
                trailing: Text(total.toString() + " €", style: TextStyle(fontSize: 18.0),),
              ),
            if (listPanier.length != 0)
              Container(
                  width: 150.0,
                  height: 50.0,
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(15.0)),
                  child: Center(child: Text("Paiement", style: TextStyle(fontSize: 20.0),),)
              )
          ],
        ),
      ),
    );
  }



  Widget _buildRow(Article article){

    final Arguments arg = ModalRoute.of(context).settings.arguments;
    List<Article> listPanier = arg.list;
    int nbArticles = arg.nbArticles;
    AlertDialog supp = AlertDialog(
        title: Text("Voulez-vous supprimer cet article de votre panier ?"),
        actions: [
          TextButton(
            child: Text("Non"),
            onPressed: () {
              Navigator.of(context).pop();
              setState((){});
            },
          ),
          TextButton(
            child: Text("Oui"),
            onPressed: () {
              listPanier.remove(article);
              nbArticles = listPanier.length;
              sharedPref.saveInt("nbArticles", nbArticles);
              sharedPref.save("article" + nbArticles.toString(), article);
              Navigator.of(context).pop();
              setState((){});
            },
          )
        ]
    );


    return ListTile(
        leading: Icon(Icons.image_outlined,),
        title: Text(article.nom),
        subtitle: Text(article.description),
        trailing: Text(article.prix.toString() + " €"),
        onLongPress: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return supp;
              }
          );
        }
    );
  }
}