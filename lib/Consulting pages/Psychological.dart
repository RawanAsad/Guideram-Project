import 'package:flutter/material.dart';
import 'package:guideram/Main_Screen.dart';
import 'package:get/get.dart';
import 'package:guideram/controllers/expertscontroller.dart';
import 'package:guideram/model/Experts.dart';


class Psychological_Con extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Get.delete<ExpertsController>();
    ExpertsController expertsController=Get.put(ExpertsController("Psychological"));
    List<Experts> experts =expertsController.experts;

    //loaderOverlay is an external dependency so don't think about it a lot (:


    //for showing the loader
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigation
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Main_Screen();
            }));
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Psychological Consulting',
              style: TextStyle(color: Colors.white,
              fontSize:15.0 ,
              ),
            ),
          ],
        ),
      ),
      body:Obx(
    ()=> expertsController.isLoading.value
    ?CircularProgressIndicator():Padding(
        padding: const EdgeInsets.all(8.0),
        child:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(
                    1.0,
                  ),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('Search'),
                  ],
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics:NeverScrollableScrollPhysics(),
                scrollDirection:Axis.vertical,
                itemBuilder:(context,index) => buildExpertsitem(experts[index]) ,
                separatorBuilder:(context,index) => SizedBox(
                  height:10,
                ) ,
                itemCount: experts.length,
              ),

            ],
          ),
        ),
      ),
    ),);
  }

  Widget buildExpertsitem(Experts expert) =>
      MaterialButton(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          '${expert.name}',
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
            Column(
              children: [
                Text(
                  '_________________________________________________',
                  style: TextStyle(
                    color: Colors.purple[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        onPressed: (){},
      );
}
