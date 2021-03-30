import 'package:flutter/material.dart';
import 'package:e_shop/class.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.listPanier, this.infos}) : super(key: key);
  final String title;
  final List<Article> listPanier;
  final InfosCompte infos;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> {
  SharedPrefs sharedPref = SharedPrefs();
  var nbArticles = 0;
  loadSharedPrefsInt() async {
    try {
      var test = sharedPref.readInt("nbArticles");
      Scaffold.of(context).showSnackBar(SnackBar(
          content: new Text("Loaded!"),
          duration: const Duration(milliseconds: 500)));
      setState(() {
        nbArticles = test;
        }
      );
    }
    catch (Exception) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: new Text("Nothing found!"),
          duration: const Duration(milliseconds: 500)));
    }
  }
  loadSharedPrefs() async {
    try {
      List<Article> test = [];
      for (var i=0; i<nbArticles;i++){
        test.add(Article.fromJson(await sharedPref.read("article" + (i+1).toString())));
      }
      Scaffold.of(context).showSnackBar(SnackBar(
          content: new Text("Loaded!"),
          duration: const Duration(milliseconds: 500)));
      setState(() {
        for (var i=0; i<nbArticles;i++){
          widget.listPanier[i] = test[i];
        }
      });
    }
    catch (Exception) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: new Text("Nothing found!"),
          duration: const Duration(milliseconds: 500)));
    }
  }

  @override
  Widget build(BuildContext context) {
    Article test1 = new Article("Article 1", "Description de l'article 1", 12.3);
    Article test2 = new Article("Article 2", "Description de l'article 2", 28.0);
    Article test3 = new Article("Article 3", "Description de l'article 3", 5.23);
    Article test4 = new Article("Article 4", "Description de l'article 4", 17.99);
    Article test5 = new Article("Article 5", "Description de l'article 5", 58.0);
    Article test6 = new Article("Article 6", "Description de l'article 6", 45.12);
    Article test7 = new Article("Article 7", "Description de l'article 7", 29.99);
    Article test8 = new Article("Article 8", "Description de l'article 8", 19.99);
    Article test9 = new Article("Article 9", "Description de l'article 9", 89.99);
    Article test10 = new Article("Article 10", "Description de l'article 10", 500.0);
    Article test11 = new Article("Article 11", "Description de l'article 11", 178.48);
    Article test12 = new Article("Article 12", "Description de l'article 12", 2.99);
    Article test13 = new Article("Article 13", "Description de l'article 13", 76.32);
    Article test14 = new Article("Article 14", "Description de l'article 14", 25.09);
    Article test15 = new Article("Article 15", "Description de l'article 15", 68.99);

    List<Article> listArticles = [test1, test2, test3, test4, test5, test6,
      test7, test8, test9, test10, test11, test12, test13, test14, test15];

    loadSharedPrefsInt();
    loadSharedPrefs();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/SecondPage',
                arguments: new Arguments(widget.listPanier, widget.infos, nbArticles),
              );
              setState(() {

              });
            },
            icon: Icon(Icons.shopping_basket,)),
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/ThirdPage', arguments: new Arguments(widget.listPanier, widget.infos, nbArticles));
              setState(() {

              });
            },
            icon: Icon(Icons.account_circle,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i in listArticles) _buildRow(i),
          ],
        ),
      ),
    );
  }





  Widget _buildRow(Article article){

    AlertDialog ajout = AlertDialog(
        title: Text("Voulez-vous ajouter cet article à votre panier ?"),
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
              widget.listPanier.add(article);
              nbArticles = widget.listPanier.length;
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
                return ajout;
              }
          );
        },
        onTap: () {
          Navigator.pushNamed(context, '/FourthPage', arguments: new Arguments1(widget.listPanier, article));
        }
    );
  }
}