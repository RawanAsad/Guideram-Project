import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:guideram/Consulting%20pages/ExpertByType.dart';
import 'package:guideram/Expert_profile.dart';
import 'package:guideram/Favourite.dart';
import 'package:guideram/Search_screen.dart';
import 'package:guideram/controllers/authController.dart';
import 'package:guideram/controllers/expertcontroller.dart';
import 'package:guideram/controllers/expertscontroller.dart';
import 'package:guideram/login.dart';
import "globalvariables.dart" as globals;

class Main_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    var searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        leading: Row(
          children: [
            SizedBox(
              width: 16.0,
            ),
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
          ],
        ),
        title: Row(
          children: [
            Text(
              'Guideram',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23.0,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () {
              Get.offAll(()=>Login());
              globals.tokken = "";
              authController.isAuth(false);
              authController.stateId=0;
              authController.stateToken="";
              //Navigation
              Get.snackbar(
                "Info",
                "Logout Successful",
                snackPosition: SnackPosition.BOTTOM,
              );

            },
          ),
        ],
      ),
      floatingActionButton: (authController.isExpert)
          ? FloatingActionButton(
              backgroundColor: Colors.purple[800],
              child: Icon(
                Icons.person,
                size: 28,
              ),
              onPressed: () {
                Get.to(()=>expert_profile());
                Get.delete<ExpertController>(); //Navigation

              },
            )
          : FloatingActionButton(
              backgroundColor: Colors.purple[800],
              child: Icon(
                Icons.favorite,
                size: 28,
              ),
              onPressed: () {
                  Get.to(()=>Favourite(),arguments: authController.stateId);
              },
            ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 2.0,
                ),
                TextField(
                  maxLines: 1,
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    border: OutlineInputBorder(
                      gapPadding: 2.0,
                    ),
                    prefixIcon: IconButton(
                      color: Colors.purple[800],
                      icon: Icon(Icons.search),
                      onPressed: () {
                      
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 22.0,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20.0),
                            color: Colors.purple[800],
                          ),
                          child: IconButton(
                            iconSize: 145.0,
                            icon: Image(
                              image: AssetImage('assets/images/p1.png'),
                              height: 150.0,
                              width: 150.0,
                            ),
                            onPressed: () {
                              Get.delete<ExpertsController>(); //Navigation
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const ExpertsByType("medical");
                              }));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Medical Consulting',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20.0),
                            color: Colors.purple[800],
                          ),
                          child: IconButton(
                            iconSize: 145.0,
                            icon: Image(
                              image: AssetImage('assets/images/p2.png'),
                              height: 150.0,
                              width: 150.0,
                            ),
                            onPressed: () {
                              Get.delete<ExpertsController>();
                              //Navigation
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const ExpertsByType("Professional");
                              }));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Professional Consulting',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20.0),
                            color: Colors.purple[800],
                          ),
                          child: IconButton(
                            iconSize: 145.0,
                            icon: Image(
                              image: AssetImage('assets/images/p3.png'),
                              height: 150.0,
                              width: 150.0,
                            ),
                            onPressed: () {
                              Get.delete<ExpertsController>();
                              //Navigation
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const ExpertsByType("Psychological");
                              }));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Psychological Consulting',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20.0),
                            color: Colors.purple[800],
                          ),
                          child: IconButton(
                            iconSize: 145.0,
                            icon: Image(
                              image: AssetImage('assets/images/p4.png'),
                              height: 150.0,
                              width: 150.0,
                            ),
                            onPressed: () {
                              Get.delete<ExpertsController>();

                              //Navigation
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const ExpertsByType("Familial");
                              }));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Family Consulting',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(20.0),
                          color: Colors.purple[800],
                        ),
                        child: IconButton(
                          iconSize: 145.0,
                          icon: Image(
                            image: AssetImage('assets/images/p5.png'),
                            height: 150.0,
                            width: 150.0,
                          ),
                          onPressed: () {
                            Get.delete<ExpertsController>();
                            //Navigation
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const ExpertsByType("Business");
                            }));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        'Management and business consulting',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
