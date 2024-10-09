import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guideram/Expert_profile.dart';
import 'package:guideram/controllers/authController.dart';
import 'package:guideram/controllers/expertcontroller.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:inspection/inspection.dart';
import "package:get/get.dart";

class Counseling_Settings extends StatefulWidget {
  const Counseling_Settings({Key? key}) : super(key: key);

  @override
  State<Counseling_Settings> createState() => _Counseling_SettingsState();
}

/*class Work_Time {
  final String day;
  final String from;
  final String to;
  Work_Time({
    required this.day,
    required this.from,
    required this.to,
  });
}*/

class Counseling {
  final int id;
  final String name;

  Counseling({
    required this.id,
    required this.name,
  });
}
AuthController authController=Get.put(AuthController());
ExpertController expertController = Get.put(ExpertController(authController.stateId));
class _Counseling_SettingsState extends State<Counseling_Settings> {

  var PriceController = TextEditingController();
  var startController = TextEditingController();
  var endController = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  var Form_Key = GlobalKey<FormState>();
  final multiSelectKey = GlobalKey<FormFieldState>();
  var Select_day = "Sunday";

  isValid() {
    return FormKey.currentState!.validate();
  }

  isTimeValid() {
    if (int.parse(startController.text) < int.parse(endController.text)) {
      print(startController.text);
      print(endController.text);
    } else {
      _showToast(context);
    }
    return Form_Key.currentState!.validate();
  }

  static List<Counseling> con = [
    Counseling(id: 1, name: "Medical"),
    Counseling(id: 2, name: "Professional"),
    Counseling(id: 3, name: "Psychological"),
    Counseling(id: 4, name: "Family"),
    Counseling(id: 5, name: "business"),
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("1 hour"), value: '1'),
      DropdownMenuItem(child: Text("2 hours"), value: '2'),
      DropdownMenuItem(child: Text("3 hours"), value: '3'),
    ];
    return menuItems;
  }

  final _items =
      con.map((Con) => MultiSelectItem<Counseling>(Con, Con.name)).toList();
  List<Counseling> selectedCounseling = [];

  /*List<Work_Time> wt = [
    Work_Time(day: 'Sun', from: '9', to: '12'),
    Work_Time(day: 'Mon', from: '9', to: '12'),
    Work_Time(day: 'Tue', from: '9', to: '12'),
    Work_Time(day: 'Wed', from: '9', to: '12'),
    Work_Time(day: 'Thu', from: '9', to: '12'),
    Work_Time(day: 'Fri', from: '9', to: '12'),
    Work_Time(day: 'Sat', from: '9', to: '12'),
  ];*/

  @override
  void initState() {
    selectedCounseling = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(authController.stateId);

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
          'Counseling Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: FormKey,
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 1,
                    controller: PriceController,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (input) => inspection(
                        input, 'required|float|between:1,10000',
                        message: 'select a number between 1 and 100000'),
                    /*validator: (value) {
                      double? num = double.tryParse(value.toString());
                      if(num == null)
                        return "Price of session can't be empty";
                      else if( num<0 || num>10000)
                        return 'Please enter value between 1 and 10.000';

                     /*if (value?.length!<0 || value?.length>5 ) {
                        return "Enter a valid price";
                      }*/
                     /* RegExp regExp = new RegExp(r'(/^([1-9]{1,2}|10000)$/)');
                      if (!regExp.hasMatch(value!)) {
                        return 'Please enter valid number';
                      }*/
                      return null;
                    },*/
                    decoration: InputDecoration(
                      hintText: 'Price of session',
                      border: OutlineInputBorder(
                        gapPadding: 5.0,
                      ),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.monetization_on_outlined,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                          labelText: 'Select the duration of the session',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.purple.shade800, width: 2),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.purple.shade800, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.white),
                      validator: (value) =>
                          value == null ? "Select a time" : null,
                      // dropdownColor:,
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MultiSelectDialogField(
                    onConfirm: (val) {
                      selectedCounseling = val;
                    },
                    buttonText: Text(
                      'Select the type of consultation',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                    selectedColor: Colors.purple[900],
                    buttonIcon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.purple[800],
                    ),
                    items: _items,
                    initialValue:
                        selectedCounseling, // setting the value of this in initState() to pre-select values.
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  /*Container(
                    width: 100.0,
                    child: MaterialButton(
                      height: 20.0,
                      onPressed: () {
                        if (FormKey.currentState!.validate()) {
                          print(PriceController.text);
                          print(DurationController.text);
                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20.0),
                      color: Colors.purple[800],
                    ),
                  ),*/
                  Obx(
                    () => expertController.isLoading.value
                        ? CircularProgressIndicator()
                        : Container(
                            width: 100.0,
                            child: MaterialButton(
                              height: 20.0,
                              onPressed: () {
                                if (isValid()) {
                                  List<dynamic> cons = [];
                                  for (int i = 0;
                                      i < selectedCounseling.length;
                                      i++) {
                                    cons.add(
                                        selectedCounseling[i].id.toString());
                                  }
                                  expertController.postSettings(
                                      PriceController.text,
                                      selectedValue!,
                                      cons);
                                }
                              },
                              child: Text(
                                'submit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(20.0),
                              color: Colors.purple[800],
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add work time:',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton(
                      isExpanded: true,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 15),
                      underline:
                          Divider(color: Colors.purple[800], height: 2.0),
                      iconEnabledColor: Colors.purple[800],
                      items: [
                        "Sunday",
                        "Monday",
                        "Tuesday",
                        "Wednesday",
                        "Thursday",
                        "Friday",
                        "Saturday",
                      ]
                          .map((e) => DropdownMenuItem(
                                child: Text("$e"),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          Select_day = value!;
                        });
                      },
                      value: Select_day,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Form(
                    key: Form_Key,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Flexible(
                          child: TextFormField(
                            maxLines: 1,
                            controller: startController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onFieldSubmitted: (String value) {
                              print(value);
                            },
                            validator: (input) => inspection(
                                input, 'required|numeric|between:0,23',
                                message: 'number  0 -> 23'),
                            decoration: InputDecoration(
                              labelText: 'start',
                              border: OutlineInputBorder(
                                gapPadding: 5.0,
                              ),
                              prefixIcon: Icon(
                                color: Colors.purple[800],
                                Icons.access_time,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Flexible(
                          child: TextFormField(
                            maxLines: 1,
                            controller: endController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onFieldSubmitted: (String value) {
                              print(value);
                            },
                            validator: (input) => inspection(
                                input, 'required|numeric|between:1,24',
                                message: 'number  1 -> 24'),
                            decoration: InputDecoration(
                              labelText: 'end',
                              border: OutlineInputBorder(
                                gapPadding: 5.0,
                              ),
                              prefixIcon: Icon(
                                color: Colors.purple[800],
                                Icons.access_time_sharp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Obx(
                    () => expertController.isLoading2.value
                        ? CircularProgressIndicator()
                        : Container(
                            width: 100.0,
                            child: MaterialButton(
                              height: 20.0,
                              onPressed: () {
                                if (isTimeValid()) {
                                  expertController.postWorkTime(Select_day,
                                      startController.text, endController.text);
                                  Get.back();
                                }
                              },
                              child: Text(
                                'add',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(20.0),
                              color: Colors.purple[800],
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     SizedBox(
                  //       width: 5.0,
                  //     ),
                  //     Text(
                  //       'Your work times:',
                  //       style: TextStyle(
                  //         fontSize: 22.0,
                  //         fontWeight: FontWeight.w300,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 10.0,
                  // ),
                  // Column(
                  //   children: [
                  //     _createDataTable()
                      // DataTable(
                      //   columnSpacing: 70,
                      //   horizontalMargin: 10,
                      //   columns: const <DataColumn>[
                      //     DataColumn(
                      //       label: Expanded(
                      //         child: Text(
                      //           'Day',
                      //           style: TextStyle(
                      //             color: Color(0xFF6A1B9A),
                      //             fontSize: 18.0,
                      //             fontWeight: FontWeight.w300,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     DataColumn(
                      //       label: Expanded(
                      //         child: Text(
                      //           'From',
                      //           style: TextStyle(
                      //             color: Color(0xFF6A1B9A),
                      //             fontSize: 18.0,
                      //             fontWeight: FontWeight.w300,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     DataColumn(
                      //       label: Expanded(
                      //         child: Text(
                      //           'To',
                      //           style: TextStyle(
                      //             color: Color(0xFF6A1B9A),
                      //             fontSize: 18.0,
                      //             fontWeight: FontWeight.w300,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      //   rows: const <DataRow>[
                      //     DataRow(
                      //       cells: <DataCell>[
                      //         DataCell(Text(
                      //           'Sunday',
                      //           style: TextStyle(
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.w300,
                      //           ),
                      //         )),
                      //         DataCell(Text(
                      //           '9',
                      //           style: TextStyle(
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.w300,
                      //           ),
                      //         )),
                      //         DataCell(Text(
                      //           '12',
                      //           style: TextStyle(
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.w300,
                      //           ),
                      //         )),
                      //       ],
                      //     ),
                      //     DataRow(
                      //       cells: <DataCell>[
                      //         DataCell(Text(
                      //           'Monday',
                      //           style: TextStyle(
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.w300,
                      //           ),
                      //         )),
                      //         DataCell(Text(
                      //           '9',
                      //           style: TextStyle(
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.w300,
                      //           ),
                      //         )),
                      //         DataCell(Text(
                      //           '12',
                      //           style: TextStyle(
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.w300,
                      //           ),
                      //         )),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      /*Row(
                        children: [
                          const SizedBox(
                            width:25.0,
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                            ),
                            'Day',
                          ),
                          const SizedBox(
                            width:78.0,
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                            ),
                            'From',
                          ),
                          const SizedBox(
                            width:80.0,
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                            ),
                            'To',
                          ),
                        ],
                      ),*/
                      // SizedBox(
                      //   height: 15,
                      // ),
                      /* ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) =>
                            build_worktime_item(wt.elementAt(index), context),
                        separatorBuilder: (context, index) => SizedBox(
                          height:5,
                        ),
                        itemCount: wt.length,
                      ),*/
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*Widget build_worktime_item(Work_Time wt, BuildContext context) => Center(
        child: Row(
          children: [
            const SizedBox(
              width: 30.0,
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
              '${wt.day}',
            ),
            const SizedBox(
              width: 90.0,
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
              '${wt.from}',
            ),
            const SizedBox(
              width: 100.0,
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
              '${wt.to}',
            ),
          ],
        ),
      );*/
  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: Expanded(
          child: Text(
            'Day',
            style: TextStyle(
              color: Color(0xFF6A1B9A),
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'From',
            style: TextStyle(
              color: Color(0xFF6A1B9A),
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'To',
            style: TextStyle(
              color: Color(0xFF6A1B9A),
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    ];
  }
  List<DataRow> _createRows() {
    print( expertController.expert!.workTime);
    Map<int,String> dayMap={
      1:"Sunday",
      2:"Monday",
      3:"Tuesday",
      4:"Wednesday",
      5:"Thursday",
      6:"Friday",
      7:"Saturday",
    };
    return expertController.expert!.workTime
        !.map((time) =>  DataRow(
      cells: <DataCell>[
        DataCell(Text(
          dayMap[time.day]!,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w300,
          ),
        )),
        DataCell(Text(
          time.from.toString(),
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w300,
          ),
        )),
        DataCell(Text(
          time.to.toString(),
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w300,
          ),
        )),
      ],
    ),)
        .toList();
  }
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('The start time must be smaller than the end time'),
        action: SnackBarAction(
            label: 'ok', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
