import 'package:auto_size_text/auto_size_text.dart';
import 'package:dpr_doctor_app/Controller/AuthController.dart';
import 'package:dpr_doctor_app/UI/SignupPage/EducationPage.dart';
import 'package:dpr_doctor_app/UI/SignupPage/SignUpHeader.dart';
import 'package:dpr_doctor_app/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import "dart:ui" as ui;
//import 'package:percent_indicator/circular_percent_indicator.dart';

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
                  color: primaryBlue,
                  child: Column(
                    children: [
                      SizedBox(height:40,),
                      SignupHeader(constraints: constraints,page: 1,pagePercent: 0.25,pageTitle: "Personal Info",pageSubTitle: "Next Education, Experience, Chamber"),
                      SizedBox(height:20,),
                      Expanded(
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
                                      width: constraints.maxWidth/2,
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


                                        ),
                                        textAlign: TextAlign.start,
                                        cursorColor: Colors.black87,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),

                                    Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.width/4,
                                          width: MediaQuery.of(context).size.width/4,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.transparent,
                                            border: Border.all(color: progressBlue,width: 2)
                                          ),
                                        ),


                                        Positioned(
                                          top: 70,
                                          right: 10,
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



                                TextField(
                                  autofocus: false,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: subHead,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Name *",

                                  ),
                                  textAlign: TextAlign.start,
                                  cursorColor: Colors.black87,
                                  keyboardType: TextInputType.number,
                                ),

                                SizedBox(height: 10,),


                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          hintText: "Date of birth",
                                          // border: InputBorder.none,



                                          suffixIcon: IconButton(
                                            onPressed: (){

                                            },
                                            icon: Icon( Feather.calendar ,color: Colors.black45, size: h4),
                                          )
                                        ),
                                        textAlign: TextAlign.start,
                                        cursorColor: Colors.black87,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),



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

                                SizedBox(height: 5,),

                                Container(
                                  height: 50,
                                  width: constraints.maxWidth,
                                  color: white,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),

                                  child: DropdownButtonHideUnderline (
                                    child: DropdownButton<dynamic>(
                                      hint: Text("Gender *"),
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
                                ),




                                SizedBox(height: 5,),

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
                                      //focusedBorder: InputBorder.none,
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

                                SizedBox(height: 20,),


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
                                Padding(
                                  padding: const EdgeInsets.only(top:8, bottom: 8),
                                  child: RichText(
                                    text: TextSpan(
                                      children: <InlineSpan> [

                                        WidgetSpan(
                                          alignment: ui.PlaceholderAlignment.middle,
                                          child: Icon(Icons.info, size: 16.55, color: primaryBlue,),
                                        ),
                                        TextSpan(
                                            text: " Through social links, only public information are visible", style: TextStyle(color: primaryBlue, fontSize: caption,fontWeight: FontWeight.w600)
                                        ),
                                      ],
                                    ),
                                  ),
                                ),


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