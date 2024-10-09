import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guideram/Main_Screen.dart';
import 'package:guideram/choose.dart';
import 'package:guideram/controllers/authController.dart';
import 'package:image_picker/image_picker.dart';
import "globalvariables.dart" as globals;
import "package:http/http.dart" as http;
import 'dart:convert';
import "package:get/get.dart";
class Expert_Screen extends StatefulWidget {
  @override
  State<Expert_Screen> createState() => _Expert_ScreenState();
}

class _Expert_ScreenState extends State<Expert_Screen> {
  var NameController = TextEditingController();

  var phoneController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var AddressController = TextEditingController();

  var ExperienceController = TextEditingController();
  bool _obscureText = true;
  var FormKey = GlobalKey<FormState>();
  var Select_Consulting = "Medical Consulting";

  AuthController authController=Get.put(AuthController());

  isValid() {
    return FormKey.currentState!.validate();
  }

  File? _image;
  PickedFile?_pickedFile;
  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future<void> getImage(ImageSource media) async {
    _pickedFile = await picker.getImage(source:media);
    if(_pickedFile!=null) {
      setState(() {
        _image =File(_pickedFile!.path) ;
      });
      print(_image);
    }
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    var vendorProfile;
    var SvgPicture;
    var apiUrl;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
//Navigation
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return choose();
            }));
          },
        ),
        titleSpacing: 10.0,
        title: Text(
          'Sign up as an Expert',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: FormKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      _image != null
                          ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child:  Image.file(
                            //to show image, you type like this.
                            File(_image!.path),
                            fit: BoxFit.cover,
                            width:110,
                            height:110,
                          ),
                        ),
                      )
                          :CircleAvatar(
                        radius:50.0,
                        backgroundImage:AssetImage('assets/images/user.png'),
                      ),
                      IconButton(
                        icon:Icon(
                          color: Colors.purple[800],
                          Icons.camera_alt,
                          size: 28.0,
                        ),
                        onPressed: (){
                          myAlert();
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height:15.0,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: NameController,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Your name can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        gapPadding: 5.0,
                      ),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.perm_identity_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Your phone number can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        gapPadding: 5.0,
                      ),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.phone_android,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: AddressController,
                    keyboardType: TextInputType.streetAddress,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Your address can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Address',
                      fillColor: Colors.white,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45),
                      ),
                      //  labelStyle: TextStyle(color: Colors.purple),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black45),
                      ),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.maps_home_work_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      RegExp regex = RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?)*$");
                      if (value != null && value.isEmpty) {
                        return "Your email can't be empty";
                      }
                      if (!regex.hasMatch(value!)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.email_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    validator: (Value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                      var passValue = Value ?? "";
                      if (passValue.isEmpty) {
                        return ("Password is required");
                      } else if (passValue.length < 6) {
                        return ("Password Must be more than 5 characters");
                      } else if (!regex.hasMatch(passValue)) {
                        return ("Password should contain upper,lower and digit character ");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.lock_outline_rounded,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.purple[800],
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    maxLines: 3,
                    controller: ExperienceController,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Your experience can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Experiences in detail',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.description_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Choose the type of consultation that you want:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,

                    ),
                  ),
                  SizedBox(
                    height:5.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButton(
                      underline: Divider(color: Colors.purple[800],
                      height: 5.0),
                      isExpanded:true,
                      iconEnabledColor: Colors.purple[800],
                      items: [
                        "Medical Consulting",
                        "Professional Consulting",
                        "Psychological Consulting",
                        "Family Consulting",
                        "Business Consulting",
                      ]
                          .map((e) => DropdownMenuItem(
                                child: Text("$e"),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {
                       setState(() {
                         Select_Consulting = value! ;
                       });
                      },
                      value: Select_Consulting,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),

                  Obx(
                        ()=> authController.isLoading.value ?
                    CircularProgressIndicator():Container(
                    width: 100.0,
                    child: MaterialButton(
                      height: 20.0,
                      onPressed: () {
                        if (isValid()) {
                          // postRequest();
                          authController.CreateExpert(NameController.text,phoneController.text,emailController.text, passwordController.text,ExperienceController.text,AddressController.text,Select_Consulting,_image);
                          if(authController.isAuth==true){
                          }
                          print("error");
                        }
                      },
                      child: Text(
                        'Sign up',
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
                  ),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
