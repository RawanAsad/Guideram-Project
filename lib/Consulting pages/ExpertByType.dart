import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guideram/Main_Screen.dart';
import 'package:guideram/controllers/expertcontroller.dart';
import 'package:guideram/controllers/expertscontroller.dart';
import 'package:guideram/controllers/visitedexpertcontroller.dart';
import 'package:guideram/model/Experts.dart';
import '../expert_user_screen.dart';

class ExpertsModel {
  final String name;

  ExpertsModel({
    required this.name,
  });
}

class ExpertsByType extends StatelessWidget {
  final String type;

  const ExpertsByType(this.type, {super.key});

  Widget buildExpertsitem(Experts expert, BuildContext context) =>
      MaterialButton(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_outline_rounded,
                      color: Colors.purple[800],
                    ),
                    SizedBox(
                      width:20.0 ,                    ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          '${expert.name}',
                        ),
                    SizedBox(
                      height:50.0 ,                    ),
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
        onPressed: () {
          Get.delete<VisitedExpertController>();
          Get.to(expert_user_screen(),arguments:expert.expertId!);
        },
      );

  @override
  Widget build(BuildContext context) {
    ExpertsController expertController = Get.put(ExpertsController(type));
    List<Experts> experts = expertController.experts;
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
              '$type Consulting',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => expertController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) =>
                            buildExpertsitem(experts.elementAt(index), context),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemCount: experts.length,
                      ),
                ),
              ),
      ),
    );
  }
}
