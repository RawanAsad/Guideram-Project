import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:guideram/model/Experts.dart';
import "package:http/http.dart" as http;
import "package:guideram/globalvariables.dart" as globals;


class SearchController extends GetxController {
  var isLoading = true.obs;
  var experts=<Experts>[];
String search="";
  SearchController(this.search);

  Future <void>onInit() async {
    super.onInit();
    fetchSearchExpert(search);
  }

    fetchSearchExpert(String search)async{
    try{

      isLoading(true);
      http.Response response=await http.get(Uri.parse("${globals.Uri}/api/experts/?search=$search")!,headers: {"Authorization":"Bearer ${globals.tokken}"});
      print(response.statusCode);
      if(response.statusCode==200){
        experts.removeRange(0, experts.length);
        var result=jsonDecode(response.body);
        print(result);
        result["data"].forEach((ex)=>
            experts.add(Experts.fromJson(ex))
        );
         experts=filterExperts(search, experts);
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
  filterExperts(String search, List<Experts> indexExperts) {
    List<Experts> res = [];
    if (search.isEmpty) {
      res = indexExperts;
    } else {
      for (int i = 0; i < indexExperts.length; i++) {
        if (("${indexExperts[i].name?.toLowerCase()}"
            .contains(search.toLowerCase()))||("${indexExperts[i].experience?.toLowerCase()}".contains(search.toLowerCase()))) {
          res.add(indexExperts[i]);
        }
      }
    }
    return res;
  }
}