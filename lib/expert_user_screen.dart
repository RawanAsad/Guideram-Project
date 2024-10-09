import 'package:flutter/material.dart';
import 'package:guideram/Appointment_Booking.dart';
import 'package:guideram/Counseling_Settings.dart';
import 'package:guideram/Main_screen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:guideram/controllers/expertcontroller.dart';
import 'package:guideram/model/Expert.dart';
import "package:get/get.dart";
import 'package:rating_dialog/rating_dialog.dart';
import "globalvariables.dart" as globals;
import 'controllers/visitedexpertcontroller.dart';

class expert_user_screen extends StatefulWidget {

  expert_user_screen( {super.key});
  @override
  State<expert_user_screen> createState() => _expert_user_screenState();
}

class _expert_user_screenState extends State<expert_user_screen> {

  bool is_fav = true;
  _expert_user_screenState();
  //
  // final _dialog = RatingDialog(
  //   enableComment: false,
  //   starColor: Colors.purple.shade800,
  //   starSize: 30,
  //   initialRating: 1.0,
  //   title: const Text(
  //     'Rating',
  //     textAlign: TextAlign.center,
  //     style: TextStyle(
  //       fontSize: 25,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  //   message: const Text(
  //     'Tap a star to set your rating',
  //     textAlign: TextAlign.center,
  //     style: TextStyle(fontSize: 15),
  //   ),
  //   submitButtonText: 'Ok',
  //   onSubmitted: (response) {
  //     print('rating: ${response.rating}');
  //
  //   // visitedExpertController.postRating(response.rating);
  //     /////////////   response.rating
  //   },
  // );

  void _show1(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Colors.white70,
        content: const Text('This expert has been added to your favorites list',
            style: TextStyle(color: Colors.black87)),
        action: SnackBarAction(
          label: 'ok',
          textColor: Colors.purple[800],
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      ),
    );
  }
  var id=Get.arguments;
  VisitedExpertController visitedExpertController = Get.put(VisitedExpertController(Get.arguments));
  @override
  Widget build(BuildContext context) {
    print(id);
    visitedExpertController.fetchExpert(id);
    print(visitedExpertController?.expert?.name);

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
            Get.to(()=>Main_Screen());
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.star,
                size: 35,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  // barrierDismissible: true, // set to false if you want to force a rating
                  builder: (context) => RatingDialog(
                    enableComment: false,
                    starColor: Colors.purple.shade800,
                    starSize: 30,
                    initialRating: 1.0,
                    title: const Text(
                      'Rating',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    message: const Text(
                      'Tap a star to set your rating',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    submitButtonText: 'Ok',
                    onSubmitted: (response) {
                       visitedExpertController.postRating(response.rating);
                      /////////////   response.rating
                    },
                  ),
                );
              }),
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.white,
                size: 40,
              ),
             authController.isExpert?Icon(Icons.ice_skating):IconButton(
                  icon: Icon(
                    is_fav ? Icons.favorite : Icons.favorite_border_outlined,
                    color: Colors.purple[800],
                  ),
                  onPressed: () {

                    visitedExpertController.postFavorite();
                    setState(() {
                      if (is_fav == false) {
                        is_fav = true;
                        _show1(context);
                      }
                    });

                  }),
            ],
          ),
          SizedBox(
            width: 5.0,
          ),
        ],
      ),
      body:  Obx(
    () => visitedExpertController.isLoading.value
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
                        image:DecorationImage(image: NetworkImage("${globals.Uri}/storage/${visitedExpertController?.expert?.photo}"),fit: BoxFit.cover),
                        color: const Color(0xffE6E6E6),
                        border: Border.all(color: const Color(0xff707070)),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      '${visitedExpertController?.expert?.name}',
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
                          '${visitedExpertController?.expert?.experience}',
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text('${visitedExpertController?.expert?.email}'),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.purple[800],
                        height: 30,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text('${visitedExpertController?.expert?.phone}'),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.purple[800],
                        height: 30,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text('${visitedExpertController?.expert?.address}'),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text(maxLines: 2, getConsultaions().toString()),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text("${visitedExpertController.expert?.rate}"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 180,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.purple[800],
                      ),
                      child: MaterialButton(
                          child: const Text(
                            'Appointment Booking',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                          onPressed: () {
                            Get.to(()=>Appointment_Booking(),arguments: id);
                          }),
                    ),
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
    visitedExpertController.expert?.expertConsultationTypes!.forEach((element) {
      consultaions+="${element.type!}  ";
    });
    return consultaions;
  }
}
