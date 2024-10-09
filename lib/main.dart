import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:guideram/Appointment_Booking.dart';
import 'package:guideram/Booked_appointments.dart';
import 'package:guideram/Counseling_Settings.dart';
import 'package:guideram/Error_Screen.dart';
import 'package:guideram/Expert_Screen.dart';
import 'package:guideram/Expert_profile.dart';
import 'package:guideram/Favourite.dart';
import 'package:guideram/Main_screen.dart';
import 'package:guideram/Search_screen.dart';
import 'package:guideram/expert_user_screen.dart';
import 'package:guideram/signup.dart';
/*import 'package:guideram/Consulting%20pages/Business_and_management.dart';
import 'package:guideram/Consulting%20pages/ExpertByType.dart';
import 'package:guideram/Error_Screen.dart';
import 'package:guideram/Expert_Screen.dart';
import 'package:guideram/Expert_profile.dart';
import 'package:guideram/Main_Screen.dart';
import 'package:guideram/shared/network/remote/dio_helper.dart';
import 'package:guideram/signup.dart';*/
import 'package:loader_overlay/loader_overlay.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner:false,
        home:Login(),
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.purple[800],
          ),
        ),
      );

  }
}
