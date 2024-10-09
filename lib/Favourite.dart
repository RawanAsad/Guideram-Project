import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:guideram/controllers/authController.dart';
import 'package:guideram/controllers/expertcontroller.dart';
import 'globalvariables.dart'as globals;
import 'Main_Screen.dart';
import 'expert_user_screen.dart';

class Fav_Experts{
  final String name;
  final String rate;
  final String price;
  Fav_Experts({
    required this.name,
    required this.rate,
    required this.price,
  });
}
class Favourite extends StatefulWidget {

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  // List<Fav_Experts> fav =[
  //   Fav_Experts(name:'Rawan', price:'90 s.p',rate:'4')
  // ];
  bool is_fav = true;
  ExpertController expertController=Get.put(ExpertController(Get.arguments));
  @override
  Widget build(BuildContext context) {
    expertController.fetchFavouriteList();
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
              'Favourite List',
              style: TextStyle(color: Colors.white,
                fontSize: 17.0,),
            ),
          ],
        ),
      ),
        body: Obx(
              () => expertController.isLoading.value
              ? Center(
            child: CircularProgressIndicator(),
          )
              :Padding(
          padding: const EdgeInsets.all(8.0),
          child:SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics:NeverScrollableScrollPhysics(),
                  scrollDirection:Axis.vertical,
                  itemBuilder:(context,index) => buildExpertsitem(expertController.favs[index],context) ,
                  separatorBuilder:(context,index) => SizedBox(
                    height:10,
                  ) ,
                  itemCount: expertController.favs.length,
                ),

              ],
            ),
          ),
      ),
    ),);
  }

  Widget buildExpertsitem(dynamic fav,BuildContext context) =>
      MaterialButton(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image:DecorationImage(image: NetworkImage("${globals.Uri}/storage/${fav["photo"]}"),fit: BoxFit.cover),
                        color: const Color(0xffE6E6E6),
                        border:
                        Border.all(color: const Color(0xff707070)),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                          '${fav['name']}',
                        ),
                        SizedBox(
                          height:7.0,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                          ),
                          'Rating: ${fav['rate']}',
                        ),
                        SizedBox(
                          height:7.0,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                          ),
                          'Session price: ${fav['cost']}',
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 35.0,
                    ),
                    Icon(
                    Icons.favorite,
                      color: Colors.purple[800],
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
        ),
        onPressed: (){
        },
      );
}
