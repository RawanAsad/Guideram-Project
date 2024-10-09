import 'package:flutter/material.dart';
import 'package:guideram/Booked_appointments.dart';
import 'package:guideram/Counseling_Settings.dart';
import 'package:guideram/Main_screen.dart';
import 'package:guideram/controllers/authController.dart';
import 'globalvariables.dart' as globals;
import 'package:guideram/controllers/expertcontroller.dart';
import 'package:guideram/login.dart';
import 'package:get/get.dart';

class expert_profile extends StatelessWidget {
  const expert_profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthController authController=Get.put(AuthController());
    ExpertController expertController = Get.put(ExpertController(authController.stateId));
    print(authController.stateId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
//Navigation
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Main_Screen();
            }));
          },
        ),
        titleSpacing: 99.0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.0,
          ),
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
              authController.stateToken="";              //Navigation
              Get.snackbar(
                "Info",
                "Logout Successful",
                snackPosition: SnackPosition.BOTTOM,
              );

            },
          ),
        ],
      ),
      body:  Obx(
            () => expertController.isLoading.value
            ? Center(
          child: CircularProgressIndicator(),
        )
            :SingleChildScrollView(
        child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: 500,
                      decoration: BoxDecoration(
                        color: Colors.purple[800],
                        borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(30),
                          bottomStart: Radius.circular(30),
                        ),
                      ),
                      //clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                  image:DecorationImage(image: NetworkImage("${globals.Uri}/storage/${expertController?.expert?.photo}"),fit: BoxFit.cover),
                                color: const Color(0xffE6E6E6),
                                border:
                                    Border.all(color: const Color(0xff707070)),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              '${expertController.expert?.name}',
                              style: TextStyle(
                                fontSize: 23.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  '${expertController.expert?.experience}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    color: Colors.black45,
                                    Icons.email_outlined,
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text('${expertController.expert?.email}'),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.purple[800],
                                height: 40,
                                indent: 10,
                                endIndent: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    color: Colors.black45,
                                    Icons.phone_android,
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Phone Number',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text('${expertController.expert?.phone}'),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.purple[800],
                                height: 40,
                                indent: 10,
                                endIndent: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    color: Colors.black45,
                                    Icons.maps_home_work_outlined,
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Address',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                          '${expertController.expert?.address}'),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.purple[800],
                                height: 40,
                                indent: 10,
                                endIndent: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    color: Colors.black45,
                                    Icons.contact_support_outlined,
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Consultation type',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(maxLines: 2, "${getConsultaions()}"),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.purple[800],
                                height: 40,
                                indent: 10,
                                endIndent: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    color: Colors.black45,
                                    Icons.credit_card,
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Wallet',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                          '${expertController.expert?.wallet}'),
                                      SizedBox(
                                        height: 25.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.purple[800],
                                height: 40,
                                indent: 10,
                                endIndent: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    color: Colors.black45,
                                    Icons.star_border_sharp,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 7.0,
                                      ),
                                      Text(
                                        'Rating',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text("${expertController.expert?.rate}"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 3.0,
                              ),
                              Container(
                                width: 140,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.purple[800],
                                ),
                                child: MaterialButton(
                                    child: const Text(
                                      'Counseling settings',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return Counseling_Settings();
                                      }));
                                    }),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                width: 140,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.purple[800],
                                ),
                                child: MaterialButton(
                                    child: Text(
                                      'Booked appointments',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return Booked_appointments();
                                      }));
                                    }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );

  }
  getConsultaions(){
    var consultaions="";
    expertController.expert?.expertConsultationTypes!.forEach((element) {
      consultaions+="${element.type!}  ";
    });
    return consultaions;
  }


}
