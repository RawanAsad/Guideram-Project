import 'package:guideram/model/Experts.dart';
import "package:guideram/globalvariables.dart" as globals;
import "package:http/http.dart" as http;
import 'dart:convert';

import 'package:get/get.dart';

class ExpertsController extends GetxController {
  var isLoading=false.obs;
  var experts=<Experts>[];
  String  type="";
  ExpertsController(this.type);

  @override

  Future <void>onInit() async{
    super.onInit();
    fetchListExpert(type);
  }
    fetchListExpert(String type)async{
      try{

        isLoading(true);
        http.Response response=await http.get(Uri.parse("${globals.Uri}/api/experts/${type}")!,headers: {"Authorization":"Bearer ${globals.tokken}"});
        print(response.statusCode);
        if(response.statusCode==200){
          experts.removeRange(0, experts.length);
          var result=jsonDecode(response.body);
          result["data"].forEach((ex)=>
              experts.add(Experts.fromJson(ex))
          );

        }
        else{
          print("error fetching code");

        }
      }catch(e){
        print("error while getting data is ${e}");
      }
      finally{
        isLoading(false);
      }
    }
  }


