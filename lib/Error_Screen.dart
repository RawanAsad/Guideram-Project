import 'package:flutter/material.dart';

class Error_Screen extends StatelessWidget {
  const Error_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
SizedBox(
  height:160.0,
),
            Container(
              child: Center(
                child: Image(
                  height:300.0 ,
                    width:300.0 ,
                    image:AssetImage("assets/images/error.png"),
                  ),
              ),
            ),
            Text(
              'Error In Credentials Provided',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
