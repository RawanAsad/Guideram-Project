// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// import 'controllers/searchController.dart';
// import 'controllers/visitedexpertcontroller.dart';
// import 'expert_user_screen.dart';
// import 'model/Experts.dart';

// class Search_screen extends StatelessWidget {
//   var arg=Get.arguments["search"];
//   SearchController searchController=Get.put(SearchController(Get.arguments["search"]));
//   Widget buildExpertsitem(Experts expert, BuildContext context) =>
//       MaterialButton(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.person_outline_rounded,
//                       color: Colors.purple[800],
//                     ),
//                     SizedBox(
//                       width:20.0 ,                    ),
//                     Text(
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       '${expert.name}',
//                     ),
//                     SizedBox(
//                       height:50.0 ,),
//                   ],
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Text(
//                   '_________________________________________________',
//                   style: TextStyle(
//                     color: Colors.purple[800],
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         onPressed: () {
//           Get.delete<VisitedExpertController>();
//           Get.to(expert_user_screen(),arguments:expert.expertId! );
//         });


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple[800],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         title: Row(
//           children: [
//             CircleAvatar(
//               radius: 20.0,
//               backgroundImage: AssetImage('assets/images/logo.png'),
//             ),
//             SizedBox(
//               width: 10.0,
//             ),
//             Text(
//               'Search',
//               style: TextStyle(color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body:Obx(
//     () => searchController.isLoading.value
//     ? Center(
//     child: CircularProgressIndicator(),
//     )
//         :Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: ListView.separated(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             itemBuilder: (context, index) =>
//                 buildExpertsitem(searchController.experts.elementAt(index), context),
//             separatorBuilder: (context, index) => SizedBox(
//               height: 10,
//             ),
//             itemCount: searchController.experts.length,
//           ),
//         ),
//       ),),
//     );
//   }
// }
