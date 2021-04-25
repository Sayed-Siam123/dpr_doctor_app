import 'package:auto_size_text/auto_size_text.dart';
import 'package:dpr_doctor_app/Controller/AuthController.dart';
import 'package:dpr_doctor_app/UI/SignupPage/EducationPage.dart';
import 'package:dpr_doctor_app/UI/SignupPage/SignUpHeader.dart';
import 'package:dpr_doctor_app/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PersonalInfoPage extends StatelessWidget {

  var _selectedGender;

  List<String> genderList = ["Male","Female","Others"];



  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return GetBuilder<AuthController>(
      init: AuthController(),
      initState: (_){

      },
      builder: (controller) {
        return WillPopScope(
          // ignore: missing_return
          onWillPop: (){
            Get.back();
          },
          child: Scaffold(
            body: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: Stack(
                    children: [
                      SignupHeader(constraints: constraints,page: 1,pagePercent: 0.25,pageTitle: "Personal Info",pageSubTitle: "Next Education, Experience, Chamber"),

                      Positioned(
                        top: 160,
                        height: constraints.maxHeight*0.75,
                        width: constraints.maxWidth,
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      width: constraints.maxWidth/2.3,
                                      child: TextField(
                                        autofocus: false,
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: subHead,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "BMDC number",
                                          // border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: greyText),
                                          ),

                                          // enabledBorder: InputBorder.none,
                                          // errorBorder: InputBorder.none,
                                          // disabledBorder: InputBorder.none,
                                          // focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(color: Colors.green),
                                          // ),
                                        ),
                                        textAlign: TextAlign.start,
                                        cursorColor: Colors.black87,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),

                                    Stack(
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.transparent,
                                            border: Border.all(color: progressBlue,width: 2)
                                          ),
                                        ),


                                        Positioned(
                                          top: 90,
                                          left: 80,
                                          child: Material(
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(18.0),
                                                side: BorderSide(color: primaryBlue)),
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: primaryBlue,
                                              ),
                                              child: Icon(Feather.camera,color: white,size: paragraph,),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                                SizedBox(height: 10,),


                                AutoSizeText("Name",style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: paragraph,
                                ),),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  width: constraints.maxWidth,
                                  child: TextField(
                                    autofocus: false,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: subHead,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Enter your full name here",
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                    textAlign: TextAlign.start,
                                    cursorColor: Colors.black87,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),

                                SizedBox(height: 10,),


                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      width: constraints.maxWidth/2.3,
                                      child: TextField(
                                        autofocus: false,
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: subHead,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "BMDC number",
                                          // border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: greyText),
                                          ),

                                          // enabledBorder: InputBorder.none,
                                          // errorBorder: InputBorder.none,
                                          // disabledBorder: InputBorder.none,
                                          // focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(color: Colors.green),
                                          // ),
                                          suffixIcon: IconButton(
                                            onPressed: (){

                                            },
                                            icon: Icon(Feather.calendar,color: Colors.black45, size: h4),
                                          )
                                        ),
                                        textAlign: TextAlign.start,
                                        cursorColor: Colors.black87,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),

                                    SizedBox(width: 10,),

                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      width: constraints.maxWidth/3,
                                      child: TextField(
                                        autofocus: false,
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: subHead,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Age",
                                          // border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: greyText),
                                          ),

                                          // enabledBorder: InputBorder.none,
                                          // errorBorder: InputBorder.none,
                                          // disabledBorder: InputBorder.none,
                                          // focusedBorder: UnderlineInputBorder(
                                          //   borderSide: BorderSide(color: Colors.green),
                                          // ),
                                        ),
                                        textAlign: TextAlign.start,
                                        cursorColor: Colors.black87,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 10,),

                                Container(
                                  height: 60,
                                  width: constraints.maxWidth,
                                  color: white,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  child: DropdownButton<dynamic>(
                                    hint: Text("Select Gender"),
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    value: _selectedGender,
                                    items: genderList.map((value) {
                                      return DropdownMenuItem<dynamic>(
                                        value: value,
                                        child: new Text(value.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (val) async{
                                      _selectedGender = val;
                                      print(val.toString());
                                      authController.updateUI();
                                    },
                                  ),
                                ),

                                Divider(),


                                SizedBox(height: 10,),

                                Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  width: constraints.maxWidth,
                                  child: TextField(
                                    autofocus: false,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: subHead,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Phone number *",
                                      // border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: greyText),
                                      ),

                                      // enabledBorder: InputBorder.none,
                                      // errorBorder: InputBorder.none,
                                      // disabledBorder: InputBorder.none,
                                      // focusedBorder: UnderlineInputBorder(
                                      //   borderSide: BorderSide(color: Colors.green),
                                      // ),
                                    ),
                                    textAlign: TextAlign.start,
                                    cursorColor: Colors.black87,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),

                                SizedBox(height: 10,),

                                Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  width: constraints.maxWidth,
                                  child: TextField(
                                    autofocus: false,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: subHead,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Email *",
                                      // border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: greyText),
                                      ),

                                      // enabledBorder: InputBorder.none,
                                      // errorBorder: InputBorder.none,
                                      // disabledBorder: InputBorder.none,
                                      // focusedBorder: UnderlineInputBorder(
                                      //   borderSide: BorderSide(color: Colors.green),
                                      // ),
                                    ),
                                    textAlign: TextAlign.start,
                                    cursorColor: Colors.black87,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),

                                SizedBox(height: 40,),

                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText("Add Social Link: ",style: TextStyle(
                                      fontSize: paragraph
                                    ),),

                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: (){

                                          },
                                          icon: Image.asset("assets/images/fb.png"),
                                        ),

                                        SizedBox(width: 10,),


                                        IconButton(
                                          onPressed: (){

                                          },
                                          icon: Image.asset("assets/images/twit.png"),
                                        ),

                                        SizedBox(width: 10,),


                                        IconButton(
                                          onPressed: (){

                                          },
                                          icon: Image.asset("assets/images/insta.png"),
                                        ),

                                        SizedBox(width: 10,),

                                      ],
                                    ),

                                  ],
                                ),


                                // AutoSizeText("BMDC Number",style: TextStyle(
                                //   color: Colors.black87,
                                //   fontSize: paragraph,
                                // ),),
                                // Container(
                                //   alignment: Alignment.centerLeft,
                                //   decoration: BoxDecoration(
                                //     color: Colors.transparent,
                                //   ),
                                //   width: constraints.maxWidth,
                                //   child: TextField(
                                //     autofocus: false,
                                //     style: TextStyle(
                                //       color: Colors.black87,
                                //       fontSize: subHead,
                                //     ),
                                //     decoration: InputDecoration(
                                //       hintText: "Enter your BMDC number here",
                                //       border: InputBorder.none,
                                //       focusedBorder: InputBorder.none,
                                //       enabledBorder: InputBorder.none,
                                //       errorBorder: InputBorder.none,
                                //       disabledBorder: InputBorder.none,
                                //     ),
                                //     textAlign: TextAlign.start,
                                //     cursorColor: Colors.black87,
                                //     keyboardType: TextInputType.number,
                                //   ),
                                // ),
                                //
                                // SizedBox(height: 10,),
                                //
                                //
                                // AutoSizeText("Password",style: TextStyle(
                                //   color: Colors.black87,
                                //   fontSize: paragraph,
                                // ),),
                                // SizedBox(height: 0,),
                                // Container(
                                //   alignment: Alignment.centerLeft,
                                //   decoration: BoxDecoration(
                                //     color: Colors.transparent,
                                //   ),
                                //   width: constraints.maxWidth,
                                //   child: TextField(
                                //     autofocus: false,
                                //     style: TextStyle(
                                //       color: Colors.black87,
                                //       fontSize: subHead,
                                //     ),
                                //     decoration: InputDecoration(
                                //         hintText: "*********",
                                //         border: InputBorder.none,
                                //         focusedBorder: InputBorder.none,
                                //         enabledBorder: InputBorder.none,
                                //         errorBorder: InputBorder.none,
                                //         disabledBorder: InputBorder.none,
                                //         suffixIcon: IconButton(
                                //           icon: Icon(authController.showPass == true ? Feather.eye : Feather.eye_off,size: 20,),
                                //           onPressed: () {
                                //
                                //             if(authController.showPass == false){
                                //               Utils().HideKeyboard();
                                //               authController.showPass = true;
                                //             }
                                //             else{
                                //               Utils().HideKeyboard();
                                //               authController.showPass = false;
                                //             }
                                //
                                //             authController.updateUI();
                                //
                                //           },
                                //         )
                                //     ),
                                //     textAlign: TextAlign.start,
                                //     cursorColor: Colors.black87,
                                //     obscureText: !authController.showPass,
                                //     keyboardType: TextInputType.text,
                                //   ),
                                // ),
                                //
                                // SizedBox(height: 10,),
                                //
                                //
                                // AutoSizeText("Confirm password",style: TextStyle(
                                //   color: Colors.black87,
                                //   fontSize: paragraph,
                                // ),),
                                // SizedBox(height: 0,),
                                // Container(
                                //   alignment: Alignment.centerLeft,
                                //   decoration: BoxDecoration(
                                //     color: Colors.transparent,
                                //   ),
                                //   width: constraints.maxWidth,
                                //   child: TextField(
                                //     autofocus: false,
                                //     style: TextStyle(
                                //       color: Colors.black87,
                                //       fontSize: subHead,
                                //     ),
                                //     decoration: InputDecoration(
                                //         hintText: "*********",
                                //         border: InputBorder.none,
                                //         focusedBorder: InputBorder.none,
                                //         enabledBorder: InputBorder.none,
                                //         errorBorder: InputBorder.none,
                                //         disabledBorder: InputBorder.none,
                                //         suffixIcon: IconButton(
                                //           icon: Icon(authController.showPass == true ? Feather.eye : Feather.eye_off,size: 20,),
                                //           onPressed: () {
                                //
                                //             if(authController.showPass == false){
                                //               Utils().HideKeyboard();
                                //               authController.showPass = true;
                                //             }
                                //             else{
                                //               Utils().HideKeyboard();
                                //               authController.showPass = false;
                                //             }
                                //
                                //             authController.updateUI();
                                //
                                //           },
                                //         )
                                //     ),
                                //     textAlign: TextAlign.start,
                                //     cursorColor: Colors.black87,
                                //     obscureText: !authController.showPass,
                                //     keyboardType: TextInputType.text,
                                //   ),
                                // ),

                                SizedBox(height: 50,),

                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: (){

                                        },
                                        child: Container(
                                          height: 50,
                                          width: constraints.maxWidth/2.5,
                                          decoration: BoxDecoration(
                                            color: primaryBlueLight,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: AutoSizeText(
                                              "Back",
                                              style: TextStyle(
                                                fontSize: h5,
                                                color: primaryBlue,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),


                                      InkWell(
                                        onTap: (){
                                          Get.to(EducationPage());
                                        },
                                        child: Container(
                                          height: 50,
                                          width: constraints.maxWidth/2.5,
                                          decoration: BoxDecoration(
                                            color: primaryBlue,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: AutoSizeText(
                                              "Next",
                                              style: TextStyle(
                                                fontSize: h5,
                                                color: white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                                SizedBox(height: 35,),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}