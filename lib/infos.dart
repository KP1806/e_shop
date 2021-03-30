import 'package:flutter/material.dart';
import 'package:e_shop/class.dart';

class Informations extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Arguments1 arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(arg.art.nom),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: <Widget> [
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(color: Colors.blue,),
                  child: Icon(Icons.image_outlined, size: 170.0,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 70.0,
                        width: 220.0,
                        /*decoration: BoxDecoration(color: Colors.grey,),*/
                        alignment: Alignment.centerLeft,
                        child: Text(
                            arg.art.nom,
                            style: TextStyle(fontSize: 35.0)
                        )
                    ),
                    Container(
                      height: 60.0,
                      width: 220.0,
                      /*decoration: BoxDecoration(color: Colors.greenAccent,),*/
                      alignment: Alignment.centerRight,
                      child: Text(
                        arg.art.prix.toString() + " €",
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 400.0,
              /*decoration: BoxDecoration(color: Colors.redAccent,),*/
              child:Text("Description longue vraiment très très longue vraiment "
                  "très très très longue toujours plus longue "
                  "Description longue vraiment très très longue vraiment "
                  "très très très longue toujours plus longue "
                  "Description longue vraiment très très longue vraiment "
                  "très très très longue toujours plus longue "
                  "Description longue vraiment très très longue vraiment "
                  "très très très longue toujours plus longue "
                  "Description longue vraiment très très longue vraiment "
                  "très très très longue toujours plus longue "
                  "Description longue vraiment très très longue vraiment "
                  "très très très longue toujours plus longue ", style: TextStyle(fontSize: 18)),
            ),
            RaisedButton(
              padding: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 50,
                child: Text("Ajouter au panier", style: TextStyle(fontSize: 17)),
                decoration: BoxDecoration(color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                arg.list.add(arg.art);
              },
            )
          ],
        ),
      ),
    );
  }
}