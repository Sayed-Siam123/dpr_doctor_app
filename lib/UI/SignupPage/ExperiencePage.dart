import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:dpr_doctor_app/Controller/AuthController.dart';
import 'package:dpr_doctor_app/Models/SignupDegreeModel.dart' as signupModel;

import 'package:dpr_doctor_app/Models/YearModel.dart';
import "dart:ui" as ui;

import 'package:dpr_doctor_app/UI/SignupPage/SignUpHeader.dart';
import 'package:dpr_doctor_app/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';


class ExperiencePage extends StatelessWidget {

  List<String> yearList = [];

  var _selectedYear;
  // ignore: deprecated_member_use
  List<signupModel.Datum> spicilites = new List<signupModel.Datum>();
  Map<dynamic,YearModel> YearMap = new Map<dynamic,YearModel>();
  @override

  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    TextEditingController FromDtCtl = TextEditingController();
    TextEditingController TomDtCtl = TextEditingController();
    bool status = false;
    return GetBuilder<AuthController>(
      init: AuthController(),
      initState: (_){
        signupModel.Datum data = new signupModel.Datum();
        spicilites.add(data);
        //YearModel datam = new YearModel(data: spicilites);
        //YearMap["data"] = datam;
        //buildYearList();
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
                  color:primaryBlue,
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      SignupHeader(constraints: constraints,page: 3,pagePercent: 0.75,pageTitle: "Experience",pageSubTitle: "Next Chamber"),
                      SizedBox(height: 20,),

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
                                //Speicilist slider

                                Padding(
                                  padding: const EdgeInsets.only(top:8, bottom: 8),
                                  child: AutoSizeText("Specialties", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                ),
                                //Show list of speicilites here

                                Padding(
                                  padding: const EdgeInsets.only(top:8, bottom: 8),
                                  child: AutoSizeText("Add More Specialty", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                ),
                                TextField(
                                  //controller: scholarship_tex,
                                  autofocus: false,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: subHead,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "e.g. Psychiatry",
                                      suffixIcon: Icon(FontAwesome.plus_circle),
                                      //: Icon(Icons.done),
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide(color: greyText),
                                    ),
                                  ),
                                  textAlign: TextAlign.start,
                                  cursorColor: Colors.black87,
                                  keyboardType: TextInputType.text,

                                ),
                                SizedBox(height: 15,),
                                Divider( color: dividerBlue, thickness: 2, ),
                                SizedBox(height: 15,),
                                //General Experience (since)
                                Padding(
                                  padding: const EdgeInsets.only(top:8, bottom: 8),
                                  child: AutoSizeText("General Experience (since)", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                ),
                                Container(
                                  //width: 200.0,
                                  height: 60.0,

                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: Colors.blueGrey)),
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton<dynamic>(

                                        hint: Text("e.g. 2000"),
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
                                         // print(index);
                                          YearMap["data"].data[0].variable.setExpYear = val.toString();
                                          //print(degreeList[index].variable.passingYear);
                                          print(val.toString());
                                          authController.updateUI();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                //Specialized Experience in
                                Padding(
                                  padding: const EdgeInsets.only(top:8, bottom: 8),
                                  child: AutoSizeText("Specialized Experience in", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        //controller: scholarship_tex,
                                        autofocus: false,
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: subHead,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Speciality",
                                          //: Icon(Icons.done),
                                          border: new OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                              const Radius.circular(10.0),
                                            ),
                                            borderSide: BorderSide(color: greyText),
                                          ),
                                        ),
                                        textAlign: TextAlign.start,
                                        cursorColor: Colors.black87,
                                        keyboardType: TextInputType.text,

                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Expanded(
                                      child:     Container(
                                        //width: 200.0,
                                        height: 61.0,

                                        decoration: BoxDecoration(

                                            borderRadius: BorderRadius.circular(10.0),
                                            border: Border.all(color: Colors.blueGrey)),
                                        child: DropdownButtonHideUnderline(
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButton<dynamic>(

                                              hint: Text("Since"),
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
                                                // print(index);
                                                YearMap["data"].data[0].variable.setExpYear = val.toString();
                                                //print(degreeList[index].variable.passingYear);
                                                print(val.toString());
                                                authController.updateUI();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
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
                                          child: Icon(Icons.add_box_rounded, size: 24, color: primaryBlue,),
                                        ),
                                        TextSpan(
                                          text: " Add More Experience(s)", style: TextStyle(color: primaryBlue, fontSize: caption,fontWeight: FontWeight.w600)
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Divider(color: dividerBlue, thickness: 2,),

//Designation
                                Padding(
                                  padding: const EdgeInsets.only(top:8, bottom: 8),
                                  child: AutoSizeText("Designation", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                ),
                                TextField(
                                  //controller: scholarship_tex,
                                  autofocus: false,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: subHead,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "e.g. Professor",
                                    //: Icon(Icons.done),
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide(color: greyText),
                                    ),
                                  ),
                                  textAlign: TextAlign.start,
                                  cursorColor: Colors.black87,
                                  keyboardType: TextInputType.text,

                                ),

//Institution
                                Padding(
                                  padding: const EdgeInsets.only(top:8, bottom: 8),
                                  child: AutoSizeText("Institution", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                ),
                                TextField(
                                  //controller: scholarship_tex,
                                  autofocus: false,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: subHead,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "e.g. Dhaka Medical College",
                                    //: Icon(Icons.done),
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide(color: greyText),
                                    ),
                                  ),
                                  textAlign: TextAlign.start,
                                  cursorColor: Colors.black87,
                                  keyboardType: TextInputType.text,

                                ),
                              //  Major
                                Padding(
                                  padding: const EdgeInsets.only(top:8, bottom: 8),
                                  child: AutoSizeText("Major", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                ),
                                TextField(
                                  //controller: scholarship_tex,
                                  autofocus: false,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: subHead,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "e.g. Anatomy",
                                    //: Icon(Icons.done),
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide(color: greyText),
                                    ),
                                  ),
                                  textAlign: TextAlign.start,
                                  cursorColor: Colors.black87,
                                  keyboardType: TextInputType.text,

                                ),
                                //Currently working
                                Padding(
                                  padding: const EdgeInsets.only(top:15, bottom: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText("Currently Working Here", maxFontSize: h5, minFontSize: h6, style: TextStyle(
                                          fontWeight: FontWeight.w600
                                      ),),
                                      CustomSwitch(

                                        activeColor: primaryBlue,
                                        value: status,
                                        onChanged: (value) => status= value
                                      ),

                                    ],
                                  )
                                ),

//From date and to date
                              Padding(
                                padding: const EdgeInsets.only(top:8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: FromDtCtl,

                                        decoration: InputDecoration(
                                          suffixIcon:
                                           Icon(Icons.calendar_today, color: Colors.black54,),


                                          border: new OutlineInputBorder(

                                            borderRadius: const BorderRadius.all(
                                              const Radius.circular(10.0),
                                            ),
                                            borderSide: BorderSide(color: greyText),
                                          ),
                                          labelText: "From ",
                                          ),
                                        onTap: () async{
                                          DateTime date = DateTime(1900);
                                          FocusScope.of(context).requestFocus(new FocusNode());

                                          date = await showDatePicker(
                                              context: context,
                                              initialDate:DateTime.now(),
                                              firstDate:DateTime(1900),
                                              lastDate: DateTime(2100));

                                          FromDtCtl.text = date.toIso8601String();},),
                                    ),
                                    SizedBox(width: 15,),
                                    Expanded(
                                      child: TextFormField(
                                        controller: TomDtCtl,
                                        decoration: InputDecoration(
                                          suffixIcon:
                                          Icon(Icons.calendar_today, color: Colors.grey[300],),
                                          border: new OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                              const Radius.circular(10.0),
                                            ),
                                            borderSide: BorderSide(color: greyText),
                                          ),
                                          labelText: "To ",
                                         ),
                                        onTap: () async{
                                          DateTime date = DateTime(1900);
                                          FocusScope.of(context).requestFocus(new FocusNode());

                                          date = await showDatePicker(
                                              context: context,
                                              initialDate:DateTime.now(),
                                              firstDate:DateTime(1900),
                                              lastDate: DateTime(2100));

                                          TomDtCtl.text = date.toIso8601String();},),
                                    ),



                                  ],
                                ),
                              ),

                                SizedBox(height: 50,),

                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          Get.to(ExperiencePage());
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
  void buildYearList(){
    for(int i = 1900; i<=DateTime.now().year; i++){
      yearList.add(i.toString());
    }
  }
}