import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return testState();
  }
}

class testState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (BuildContext context,
              AsyncSnapshot<SharedPreferences> snapshot) {
            if (!snapshot.hasData) return Text("loading...");
            SharedPreferences prefs = snapshot.data;
            
            int id = prefs.getInt("id") ;
            return SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(id == 1){
                        prefs.remove("id") ;
                      }else{
                        prefs.setInt("id" , 1) ;
                      }
                      setState(() {

                      });
                    },
                    child: Container(
                      width: 200,
                      height: 100,
                      color: Colors.red,
                      child: Center(
                        child: Text(id == 1 ? "UNSELECT" : "SELECT"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(id == 2){
                        prefs.remove("id") ;
                      }else{
                        prefs.setInt("id" , 2) ;
                      }
                      setState(() {

                      });
                    },
                    child: Container(
                      width: 200,
                      height: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text(id == 2 ? "UNSELECT" : "SELECT"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(id == 3){
                        prefs.remove("id") ;
                      }else{
                        prefs.setInt("id" , 3) ;
                      }
                      setState(() {

                      });
                    },
                    child: Container(
                      width: 200,
                      height: 100,
                      color: Colors.green,
                      child: Center(
                        child: Text(id == 3 ? "UNSELECT" : "SELECT"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
