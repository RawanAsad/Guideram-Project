import 'dart:convert';

import 'package:get/get.dart';
import 'package:guideram/model/Appointment.dart';
import 'package:guideram/model/Expert.dart';
import "package:guideram/globalvariables.dart" as globals;
import "package:http/http.dart" as http;
import '../model/ListFreeTime.dart';

class ExpertController extends GetxController {

  var isLoading = true.obs;
  var isLoading2=false.obs;
  Expert? expert;
  var expertAppointment = <Appointment>[];
  late int id;
  var favs=<dynamic>[];
  ExpertController(this.id);


  Future <void> onInit() async {
    super.onInit();
    fetchExpert(id);
    fetchAppointments(id);
  }

  fetchExpert(int id) async {
    try {
      http.Response response = await http.get(
          Uri.parse("${globals.Uri}/api/expert/${id}")!,
          headers: {"Authorization": "Bearer ${globals.tokken}"});
      print(response.statusCode);
      print( jsonDecode(response.body));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
          expert = Expert.fromJson(result["data"]);
        }
      else {
        print("error fetching code");
      }
    } catch (e) {
      print("error while getting data is ${e}");
    }
    finally {
      isLoading(false);
    }
  }

  fetchAppointments(int id) async {
    try {
      print("fetching");
      http.Response response = await http.get(
          Uri.parse("${globals.Uri}/api/expert/appointments/${id}")!,
          headers: {"Authorization": "Bearer ${globals.tokken}"});
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        result["data"].forEach((ex) {
          expertAppointment.add(Appointment.fromJson(ex));
        });
      }
      else {
        print("error fetching code");
      }
    } catch (e) {
      print("error while getting data is ${e}");
    }
    finally {
      isLoading(false);
    }
  }

  postSettings(cost,duration,List<dynamic> consultings) async {
    try {
      print(id);
      isLoading(true);
      final Uri uri = Uri.parse("${globals.Uri}/api/expert/$id");
      final headers = {"Authorization": "Bearer ${globals.tokken}","Accept":" application/json"};
      var response = await http.put(
          Uri.parse("${globals.Uri}/api/expert/$id"),
          body:{
            "cost": cost,
            "duration": duration,
          },
          headers: headers
      );
      consultings.forEach((element) async {
        var response = await http.put(
            Uri.parse("${globals.Uri}/api/expert/$id"),
            body:{
              "consultation_type_id": element,
            },
            headers: headers
        );
        print(response.statusCode);
      });
      print (response.statusCode);
      var responseData = json.decode(response.body);
      Get.snackbar(
        "Info",
        responseData["message"],
        snackPosition: SnackPosition.BOTTOM
      );
    } catch (e) {
      print(e);
    }
    finally {
      isLoading(false);

    }
  }

  postWorkTime(day,from,to) async {
    try {
      Map<String,int> dayMap={
        "Sunday":1,
        "Monday":2,
        "Tuesday":3,
        "Wednesday":4,
        "Thursday":5,
        "Friday":6,
        "Saturday":7,
      };
      isLoading2(true);
      final Uri uri = Uri.parse("${globals.Uri}/api/expert/$id");
      final headers = {"Authorization": "Bearer ${globals.tokken}","Accept":" application/json"};
      var response = await http.put(
          Uri.parse("${globals.Uri}/api/expert/$id"),
          body:{
            "day":dayMap[day].toString(),
            "from":from.toString(),
            "to":to.toString()
          },
          headers: headers
      );
      var responseData = json.decode(response.body);
      print (responseData);
      Get.snackbar(
        "Info",
        responseData["message"],
        snackPosition: SnackPosition.BOTTOM,
      );
      print ("hgjkl;jkl;jghjkl;");


    } catch (e) {
      print(e);
    }
    finally {
      isLoading2(false);
    }
  }

  fetchFavouriteList()async{
    try {
      print("fetching");
      http.Response response = await http.get(
          Uri.parse("${globals.Uri}/api/user/favorite_list")!,
          headers: {"Authorization": "Bearer ${globals.tokken}"});
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        favs=result["data"];
        print(favs);
      }
      else {
        print("error fetching code");
      }
    } catch (e) {
      print("error while getting data is ${e}");
    }
    finally {
      isLoading(false);
    }
  }
}

