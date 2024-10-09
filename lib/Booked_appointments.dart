import 'package:flutter/material.dart';
import 'package:guideram/Expert_profile.dart';
import 'package:guideram/controllers/expertcontroller.dart';
import "package:get/get.dart";
import 'package:guideram/model/Appointment.dart';


class Booked_appointments extends StatelessWidget {

  ExpertController expertController=Get.put(ExpertController(1));

  @override
  Widget build(BuildContext context) {

     List<Appointment> Bookapp=expertController.expertAppointment ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigation
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return expert_profile();
            }));
          },
        ),
        title: Text(
              'Booked appointments',
              style: TextStyle(color: Colors.white,
                fontSize: 17.0,),
            ),
      ),
      body: Obx(
    ()=> expertController.isLoading.value
    ?Center(
      child: CircularProgressIndicator(),
    ):Padding(
        padding: const EdgeInsets.only(
          left:20,
          right:20,
          top:10,
        ),
        child:SingleChildScrollView(
          child:ListView.separated(
                shrinkWrap: true,
                physics:NeverScrollableScrollPhysics(),
                scrollDirection:Axis.vertical,
                itemBuilder:(context,index) => buildExpertsitem(Bookapp[index]) ,
                separatorBuilder:(context,index) => SizedBox(
                  height:10,
                ) ,
                itemCount: Bookapp.length,
              ),
        ),
      ),
    )
      ,
    );
  }

  Widget buildExpertsitem(Appointment Bookapp) =>
      Column(
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
                    Row(
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                          "Anonymose",
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          '${getDay(Bookapp.day!)+"  "+"${Bookapp.from!<10?"0${Bookapp.from}":"${Bookapp.from}"}:00"}',
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
        );
  Map<int, String> Days = {
    1:"Saturday",
    2:"Sunday",
    3:"Monday",
    4:"Tuesday",
    5:"Wednesday",
    6:"Thursday",
    7:"Friday"
  };
  getDay(int day) {
    return Days[day];
  }
}

