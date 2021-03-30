import 'package:flutter/material.dart';
import 'package:e_shop/class.dart';

class Compte extends StatefulWidget {
  @override
  _CompteState createState() => _CompteState();
}



class _CompteState extends State<Compte> {
  @override
  Widget build(BuildContext context) {
    final Arguments arg = ModalRoute.of(context).settings.arguments;
    List<Article> listPanier = arg.list;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {

              });
            },
            icon: Icon(Icons.arrow_back_sharp,)),
        title: Text("Votre Compte"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/SecondPage', arguments: new Arguments(listPanier, arg.infos, arg.nbArticles));
              setState(() {

              });
            },
            icon: Icon(Icons.shopping_basket,),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 170,
                height: 170,
                /*decoration: BoxDecoration(/*color: Colors.lightGreen,*/
                border: Border.all(width: 1.0, color: Colors.black)),*/
                child: Icon(Icons.account_box_rounded, size: 180.0,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 30.0,
                      width: 220.0,
                      /*decoration: BoxDecoration(color: Colors.grey,),*/
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "Nom : " + arg.infos.nom,
                          style: TextStyle(fontSize: 20.0)
                      )
                  ),
                  Container(
                    height: 30.0,
                    width: 220.0,
                    /*decoration: BoxDecoration(color: Colors.greenAccent,),*/
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Prénom : " + arg.infos.prenom,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: 210.0,
                    /*decoration: BoxDecoration(color: Colors.green,),*/
                    alignment: Alignment.centerLeft,
                    child: Row
                      (
                      children: [
                        Text(
                          "identifiant : " + arg.infos.id,
                          style: TextStyle(fontSize: 20.0),
                        ),
                        IconButton(
                            icon: Icon(Icons.edit, size: 15.0,),
                            onPressed: () {
                              changement(arg.infos, arg.infos.id);
                            }
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(children: [
            Container(
              width: 343.0,
              /*decoration: BoxDecoration(color: Colors.redAccent,),*/
              child:Text("Adresse mail : " + arg.infos.mail,
                  style: TextStyle(fontSize: 20.0)),
            ),
            IconButton(
                icon: Icon(Icons.edit, size: 20.0,),
                onPressed: () {
                  changement(arg.infos, arg.infos.mail);
                })
          ]
          ),
          Row(children: [
            Container(

              height: 35.0,
              /*decoration: BoxDecoration(color: Colors.redAccent,),*/
              child:Text("Mot de passe : " + arg.infos.mdp,
                  style: TextStyle(fontSize: 20.0)),
            ),
            IconButton(icon: Icon(Icons.edit, size: 20.0,), onPressed: () {
              changement(arg.infos, arg.infos.mdp);
            })
          ]
          ),
          Container(
            width: 415.0,
            /*decoration: BoxDecoration(color: Colors.redAccent,),*/
            child:Text("Date d'inscription : " + arg.infos.inscription,
                style: TextStyle(fontSize: 20.0)),
          ),
        ],
      ),
    );
  }

  String aux(String str, InfosCompte i) {

    if (str == i.id){
      return("identifiant");
    }
    else if (str == i.mail){
      return("adresse mail");
    }
    else {
      return("mot de passe");
    }
  }

  void changement(InfosCompte inf, String entre){
    TextEditingController cont;

    AlertDialog edit = AlertDialog(
      title: Text("Saisissez votre nouveau " + aux(entre, inf)),
      content: TextField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            )
        ),
        controller: cont = TextEditingController(),

      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {

              });
            },
            child: Text("Annuler")
        ),
        TextButton(
            onPressed: () {
              if (aux(entre, inf) == "identifiant"){
                inf.id = cont.text;
              }
              else if (aux(entre, inf) == "adresse mail"){
                inf.mail = cont.text;
              }
              else if (aux(entre, inf) == "mot de passe"){
                inf.mdp = cont.text;
              }
              Navigator.of(context).pop();
              setState(() {

              });
            },
            child: Text("Valider")
        )
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return edit;
        }
    );
  }
}