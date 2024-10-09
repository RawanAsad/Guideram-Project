import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guideram/Counseling_Settings.dart';
import 'package:guideram/controllers/visitedexpertcontroller.dart';
import 'package:get/get.dart';
import 'package:guideram/expert_user_screen.dart';

import 'Main_Screen.dart';
import 'controllers/authController.dart';
class App_book {
  final String time;
  final String duration;
  App_book({
    required this.time,
    required this.duration,
  });
}

class Appointment_Booking extends StatefulWidget {
  const Appointment_Booking({Key? key}) : super(key: key);

  @override
  State<Appointment_Booking> createState() => _Appointment_BookingState();
}

class _Appointment_BookingState extends State<Appointment_Booking> {
  List<App_book> boo = [
    App_book(time: '9:00', duration: '1 hour'),
    App_book(time: '8:00', duration: '2 hour')
  ];

var id= Get.arguments;
  VisitedExpertController visitedExpertController = Get.put(VisitedExpertController(Get.arguments));


  @override
  Widget build(BuildContext context) {
    visitedExpertController.getListFree(id);
print(id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(()=>Main_Screen());
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
              'Appointment Booking',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
              ),
            ),
          ],
        ),
        actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 2,
                top:6 ,
                bottom:2 ,
                left:2 ,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.credit_card,
                      ),
                      Text(
                          '${visitedExpertController.expert?.cost}'
                      ),
                    ],
                  ),
                  SizedBox(
                    width:10.0,
                  ),
                ],
              ),
            ),
        ],
      ),
      body:Obx(
    () => visitedExpertController.isLoading.value
    ? Center(
    child: CircularProgressIndicator(),
    )
        : Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Sunday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(visitedExpertController.freeTime["sun"].elementAt(index), context,"Sunday"),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: visitedExpertController.freeTime["sun"].length,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Monday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(visitedExpertController.freeTime["mon"].elementAt(index), context,"Monday"),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: visitedExpertController.freeTime["mon"].length,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Tuesday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(visitedExpertController.freeTime["tus"].elementAt(index), context,"Tuesday"),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: visitedExpertController.freeTime["tus"].length,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Wednesday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(visitedExpertController.freeTime["wed"].elementAt(index), context,"Wednesday"),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: visitedExpertController.freeTime["wed"].length,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Thursday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(visitedExpertController.freeTime["ths"].elementAt(index), context,"Thursday"),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: visitedExpertController.freeTime["ths"].length,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Friday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(visitedExpertController.freeTime["fri"].elementAt(index), context,"Friday"),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: visitedExpertController.freeTime["fri"].length,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Saturday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(visitedExpertController.freeTime["sut"].elementAt(index), context,"Saturday"),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: visitedExpertController.freeTime["sut"].length,
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  Widget buildApp_booitem(int boo, BuildContext context,String day) => Row(
    children: [
      SizedBox(
        width: 35.0,
      ),
      Text(
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
        '${boo<10?"0$boo":boo}',
      ),
      SizedBox(
        width: 20.0,
      ),
      Text('-'),
      SizedBox(
        width: 20.0,
      ),
      Text(
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
        "Duration  ${visitedExpertController.expert?.duration}:00",
      ),
      SizedBox(
        width: 80.0,
      ),
      TextButton(
        child: Text(
          'Book',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        onPressed: () {
          visitedExpertController.book(day, boo);

          Timer(Duration(seconds: 2), () {
            visitedExpertController.getListFree(id);
          });
        },
      ),
    ],
  );
}
