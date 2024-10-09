import 'package:flutter/material.dart';
import 'package:guideram/Expert_Screen.dart';
import 'package:guideram/signup.dart';

class choose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height:200.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width:75,
                  ),
                  Text(
                    'Choose a type:',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton.icon(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
                      foregroundColor:Colors.purple.shade800,
                      side: BorderSide(
                          color: Colors.purple.shade800,
                          width:3),
                      shape: StadiumBorder(),
                      elevation: 6),
                  icon: Icon(
                    Icons.supervisor_account_rounded,
                    size:30,
                  ),
                  label: Text('User',
                    style: TextStyle(
                      fontSize:30,
                    ),
                  ),
                  onPressed: () {
//Navigation
                    Navigator.of(context).push(MaterialPageRoute(builder:(context){
                      return User_Screen();
                    }));
                  }),
              SizedBox(
                height: 50,
              ),
              ElevatedButton.icon(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
                      foregroundColor:Colors.purple.shade800,
                      side: BorderSide(
                          color: Colors.purple.shade800,
                          width:3),
                      shape: StadiumBorder(),
                      elevation: 5),
                  icon: Icon(
                    Icons.auto_awesome,
                    size:30,
                  ),
                  label: Text('Expert',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  onPressed: () {
//Navigation
                    Navigator.of(context).push(MaterialPageRoute(builder:(context){
                      return Expert_Screen();
                    }));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
