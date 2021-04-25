import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dpr_doctor_app/Controller/AuthController.dart';
import 'package:dpr_doctor_app/Models/SignupDegreeModel.dart';
import 'package:dpr_doctor_app/UI/SignupPage/SignUpHeader.dart';
import 'package:dpr_doctor_app/Utils/Constant.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class EducationPage extends StatelessWidget {

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

  List<Datum> degreeList = new List<Datum>();

  Map<dynamic,DegreeDataModel> degreeMap = new Map<dynamic,DegreeDataModel>();

  List<String> yearList = [];

  var _selectedYear;


  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return GetBuilder<AuthController>(
      init: AuthController(),
      initState: (_){
        Datum data = new Datum();
        degreeList.add(data);
        DegreeDataModel datam = new DegreeDataModel(data: degreeList);
        degreeMap["data"] = datam;
        buildYearList();
        authController.updateUI();
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
                      SignupHeader(constraints: constraints,page: 2,pagePercent: 0.50,pageTitle: "Education",pageSubTitle: "Next Experience, Chamber"),

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
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: degreeList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: ExpansionTileCard(
                                        leading: IconButton(
                                          onPressed: (){
                                            degreeList.removeAt(index);
                                            authController.updateUI();
                                          },
                                          icon: Icon(Feather.minus_circle,color: Colors.red,size: paragraph,),
                                        ),
                                        elevation: 0,
                                        title: Text('Degree Type ${index+1}*'),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText("Degree",style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead-1,
                                              ),),
                                            ),
                                          ),

                                          SizedBox(height: 5,),

                                          TextField(
                                            autofocus: false,
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: subHead,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: "e.g. MBBS, FCPS, MS, MD, Diploma etc.",
                                              border: new OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(
                                                  const Radius.circular(10.0),
                                                ),
                                                borderSide: BorderSide(color: greyText),
                                              ),
                                            ),
                                            textAlign: TextAlign.start,
                                            cursorColor: Colors.black87,
                                            keyboardType: TextInputType.number,
                                          ),

                                          SizedBox(height: 10,),

                                          Container(
                                            width: constraints.maxWidth,
                                            color: white,
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(5),
                                            child: DropdownButton<dynamic>(
                                              hint: Text("Select passing year"),
                                              underline: SizedBox(),
                                              isExpanded: true,
                                              value: _selectedYear,
                                              items: yearList.map((value) {
                                                return DropdownMenuItem<dynamic>(
                                                  value: value,
                                                  child: new Text(value.toString()),
                                                );
                                              }).toList(),
                                              onChanged: (val) async{
                                                _selectedYear = val;
                                                print(index);
                                                degreeMap["data"].data[index].variable.setpassingYear = val.toString();
                                                //print(degreeList[index].variable.passingYear);
                                                print(val.toString());
                                                authController.updateUI();
                                              },
                                            ),
                                          ),

                                          Divider(),

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText("Institution",style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead-1,
                                              ),),
                                            ),
                                          ),

                                          SizedBox(height: 5,),

                                          TextField(
                                            autofocus: false,
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: subHead,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: "Enter name here",
                                              border: new OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(
                                                  const Radius.circular(10.0),
                                                ),
                                                borderSide: BorderSide(color: greyText),
                                              ),
                                            ),
                                            textAlign: TextAlign.start,
                                            cursorColor: Colors.black87,
                                            keyboardType: TextInputType.number,
                                          ),


                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText("Batch",style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead-1,
                                              ),),
                                            ),
                                          ),

                                          SizedBox(height: 5,),

                                          TextField(
                                            autofocus: false,
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: subHead,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: "Enter name here",
                                              border: new OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(
                                                  const Radius.circular(10.0),
                                                ),
                                                borderSide: BorderSide(color: greyText),
                                              ),
                                            ),
                                            textAlign: TextAlign.start,
                                            cursorColor: Colors.black87,
                                            keyboardType: TextInputType.number,
                                          ),



                                          SizedBox(height: 10,),


                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText("Award",style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead-1,
                                              ),),
                                            ),
                                          ),

                                          SizedBox(height: 5,),

                                          TextField(
                                            autofocus: false,
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: subHead,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: "Enter name here",
                                              border: new OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(
                                                  const Radius.circular(10.0),
                                                ),
                                                borderSide: BorderSide(color: greyText),
                                              ),
                                            ),
                                            textAlign: TextAlign.start,
                                            cursorColor: Colors.black87,
                                            keyboardType: TextInputType.number,
                                          ),


                                          SizedBox(height: 10,),

                                        ],
                                      ),
                                    );
                                  },
                                ),

                                SizedBox(height: 10,),

                                GestureDetector(
                                  onTap: (){
                                    Datum data = new Datum();
                                    degreeList.add(data);
                                    DegreeDataModel datam = new DegreeDataModel(data: degreeList);
                                    degreeMap["data"] = datam;
                                    authController.updateUI();
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 15,
                                          width: 15,
                                          color: primaryBlue,
                                          child: Icon(Feather.plus,size: paragraph,color: white,)
                                      ),

                                      SizedBox(width: 5,),

                                      AutoSizeText("Add more degree(s)",style: TextStyle(
                                        color: primaryBlue,
                                        fontSize: caption,
                                        fontWeight: FontWeight.w600
                                      ),),
                                    ],
                                  ),
                                ),

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
                                      hintText: "Enter name here",
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

                                AutoSizeText("Phone Number",style: TextStyle(
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
                                      hintText: "+8801674893726",
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


                                AutoSizeText("BMDC Number",style: TextStyle(
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
                                      hintText: "Enter your BMDC number here",
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


                                AutoSizeText("Password",style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: paragraph,
                                ),),
                                SizedBox(height: 0,),
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
                                        hintText: "*********",
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        suffixIcon: IconButton(
                                          icon: Icon(authController.showPass == true ? Feather.eye : Feather.eye_off,size: 20,),
                                          onPressed: () {

                                            if(authController.showPass == false){
                                              Utils().HideKeyboard();
                                              authController.showPass = true;
                                            }
                                            else{
                                              Utils().HideKeyboard();
                                              authController.showPass = false;
                                            }

                                            authController.updateUI();

                                          },
                                        )
                                    ),
                                    textAlign: TextAlign.start,
                                    cursorColor: Colors.black87,
                                    obscureText: !authController.showPass,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),

                                SizedBox(height: 10,),


                                AutoSizeText("Confirm password",style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: paragraph,
                                ),),
                                SizedBox(height: 0,),
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
                                        hintText: "*********",
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        suffixIcon: IconButton(
                                          icon: Icon(authController.showPass == true ? Feather.eye : Feather.eye_off,size: 20,),
                                          onPressed: () {

                                            if(authController.showPass == false){
                                              Utils().HideKeyboard();
                                              authController.showPass = true;
                                            }
                                            else{
                                              Utils().HideKeyboard();
                                              authController.showPass = false;
                                            }

                                            authController.updateUI();

                                          },
                                        )
                                    ),
                                    textAlign: TextAlign.start,
                                    cursorColor: Colors.black87,
                                    obscureText: !authController.showPass,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),

                                SizedBox(height: 5,),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        contentPadding: const EdgeInsets.all(0),
                                        leading: Checkbox(
                                          value: authController.acceptTerms,
                                          onChanged: (val){
                                            authController.acceptTerms = val;
                                            authController.updateUI();
                                          },
                                        ),
                                        title: RichText(
                                          text: TextSpan(
                                              text: "I accept the ",
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: caption,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(text: 'terms and conditions', style: TextStyle(color: primaryBlue, fontSize: caption)
                                                )
                                              ]

                                          ),
                                        ),
                                      ),

                                      SizedBox(height: 5,),

                                      InkWell(
                                        onTap: (){

                                        },
                                        child: Container(
                                          height: 50,
                                          width: constraints.maxWidth,
                                          decoration: BoxDecoration(
                                            color: primaryBlue,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: AutoSizeText(
                                              "Sign up",
                                              style: TextStyle(
                                                fontSize: subHead,
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

  void buildYearList(){
    for(int i = 1900; i<=DateTime.now().year; i++){
      yearList.add(i.toString());
    }
  }

}