
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import "package:guideram/globalvariables.dart" as globals;
import "package:http/http.dart" as http;
import '../Main_Screen.dart';

class AuthController extends GetxController{
  var isLoading=false.obs;
   var isAuth=false.obs;

  String stateToken="";
  int stateId=0;
  bool isExpert=false;



login(String email,String password)async{
  try{
    isLoading(true);
    var response = await http.post(Uri.parse('${globals.Uri}/api/login'),body: {
      'email' : email,
      "password" : password
    });
  print(response.body);
    var responseData = json.decode(response.body);
    Get.snackbar(
      "Info",
      responseData["message"],
      snackPosition: SnackPosition.BOTTOM,
    );
    if(responseData['token'] != null) {
      var token = responseData['token'];
      isAuth(true);
      Get.offAll(()=>Main_Screen());

      //  store in some state management
      globals.tokken=token;
      stateToken=token;
      stateId=responseData['user_id'];
      isExpert=responseData['is_expert'];
    } else {
      print("errrrrrrrrrrr");
      isAuth(false);
    }
  }catch(e){
    print(e);
  }
  finally{
    isLoading(false);
  }
}

CreateUser(String name,String phone,String email,String password,image)async{
  try {
     isLoading(true);

    http.MultipartRequest request = http.MultipartRequest(
        "POST", Uri.parse("${globals.Uri}/api/user/register"))
      ..fields.addAll({"name": name, "phone":phone,"email":email,"password":password});
    isLoading.value = true;
    if (GetPlatform.isMobile && image != null) {
      File _file = File(image.path);
      request.files.add(http.MultipartFile(
          'photo', _file.readAsBytes().asStream(), _file.lengthSync(),
          filename: _file.path
              .split('/')
              .last));
    }
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
     Map map=jsonDecode(await response.stream.bytesToString());
     print(map);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.offAll(()=>Main_Screen());
      Get.snackbar(
        "Info",
        map["message"],
        snackPosition: SnackPosition.BOTTOM,
      );
      isAuth(true);
         globals.tokken=map["token"];
          stateToken=map["token"];
          stateId=map['user_id'];
         isExpert=map['is_expert'];

    } else {
    print("errororr");
    }
  } catch (e) {
    print(e);

  }
  finally{
    isLoading(false);
  }
}
  CreateExpert(String name,String phone,String email,String password,String experience,String address,String consulting,image)async{
  Map<String,int> consultingMap={"Medical Consulting":1,"Professional Consulting":2,"Psychological Consulting":3,"Family Consulting":4,"Business Consulting":5};

    try {
      isLoading(true);
      http.MultipartRequest request = http.MultipartRequest(
          "POST", Uri.parse("${globals.Uri}/api/expert/register"))
        ..fields.addAll({"name": name, "phone":phone,"email":email,"password":password,"experience":experience,"address":address,"consultation_type_id":consultingMap[consulting].toString()});
      isLoading.value = true;
      if (GetPlatform.isMobile && image != null) {
        File _file = File(image.path);
        request.files.add(http.MultipartFile(
            'photo', _file.readAsBytes().asStream(), _file.lengthSync(),
            filename: _file.path
                .split('/')
                .last));
      }
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      Map map=jsonDecode(await response.stream.bytesToString());
      print(map);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.offAll(()=>Main_Screen());
        Get.snackbar(
          "Info",
          map["message"],
          snackPosition: SnackPosition.BOTTOM,
        );
        isAuth(true);
        globals.tokken=map["token"];
        stateToken=map["token"];
        stateId=map['user_id'];
        isExpert=map['is_expert'];

      } else {
        print("errororr");
      }
      // var response = await http.post(Uri.parse("${globals.Uri}/api/expert/register"), body: {
      //   'name': name,
      //   'phone': phone,
      //   "email": email,
      //   "password":password,
      //   "address":address,
      //   "experience":experience,
      //   "consultation_type_id":consultingMap[consulting].toString()
      // });

      // var responseData = json.decode(response.body);
      // print(responseData);
      // if( responseData['token']!=null) {
      //   String token = responseData['token'];
      //
      //   isAuth(true);
      //   globals.tokken=token;
      //   stateToken=token;
      //   stateId=responseData['user_id'];
      //   isExpert=responseData['is_expert'];
      //   Get.snackbar(
      //     "Info",
      //     responseData["message"],
      //     snackPosition: SnackPosition.BOTTOM,
      //   );
      //   Get.offAll(()=>Main_Screen());
      // } else {
      //   print("err");
      // }
    } catch (e) {
      print(e);
    }
    finally{
      isLoading(false);
    }
  }
}