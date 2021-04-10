import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Article {
  /*int idImg;*/
  String nom, description;
  double prix;

  Article(String nom, String description, double prix){
    this.nom = nom;
    this.description = description;
    this.prix = prix;
  }

  Article.fromJson(Map<String, dynamic> json)
      : nom = json["nom"],
        description = json["descritpion"],
        prix = json["prix"];

  Map<String, dynamic> toJson() => {
    'nom': nom,
    "descritpion": description,
    "prix": prix,
  };

}




class SharedPrefs{
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  saveInt(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  readInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }
}



class InfosCompte {
  String nom, prenom, id, mail, mdp, inscription;

  InfosCompte(this.nom, this.id,this.inscription,this.mail, this.mdp, this.prenom) ;

}


class Arguments1 {
  List<Article> list;
  Article art;

  Arguments1(List<Article> l, Article a){
    this.list = l;
    this.art = a;
  }
}

class Arguments {
  List<Article> list;
  InfosCompte infos;
  int nbArticles;

  Arguments(List<Article> l, InfosCompte inf, int nb){
    this.list = l;
    this.infos = inf;
    this.nbArticles = nb;
  }
}