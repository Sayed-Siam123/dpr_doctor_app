import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dpr_doctor_app/Controller/AuthController.dart';
import 'package:dpr_doctor_app/Models/SignupDegreeModel.dart';
import 'package:dpr_doctor_app/UI/SignupPage/ExperiencePage.dart';
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
    final TextEditingController scholarship_tex= TextEditingController();
    final TextEditingController extra_activity_tex = TextEditingController();
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
                  color: primaryBlue,
                  child: Column(
                    children: [
                      SizedBox(height:40,),
                      SignupHeader(constraints: constraints,page: 2,pagePercent: 0.50,pageTitle: "Education",pageSubTitle: "Next Experience, Chamber"),
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
                                          //Degree
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

                                          //Institution
                                          SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.only(left:35.0, top:8.0, bottom:8.0),

                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText("Institution",style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead-1,
                                              ),),
                                            ),
                                          ),

                                          SizedBox(height: 5,),

                                          Padding(
                                            padding: const EdgeInsets.only(left:35.0),
                                            child: TextField(
                                              //controller: degreeList[index].variable.institution,
                                              autofocus: false,
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead,
                                              ),
                                              decoration: InputDecoration(
                                                hintText: "e.g. Dhaka medical college",
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
                                          ),
                                          //


                                          //Passing year
                                          SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.only(left:35.0, top:8.0, bottom:8.0),

                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText("Passing year",style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead-1,
                                              ),),
                                            ),
                                          ),


                                          Padding(
                                            padding: const EdgeInsets.only(left:35.0),
                                            child: Container(
                                              //width: 200.0,
                                              height: 60.0,

                                              decoration: BoxDecoration(

                                                  borderRadius: BorderRadius.circular(10.0),
                                                  border: Border.all(color: Colors.blueGrey)),
                                              child: DropdownButtonHideUnderline(
                                                child: ButtonTheme(
                                                  alignedDropdown: true,
                                                  child: DropdownButton<dynamic>(

                                                    hint: Text("e.g. 1900"),
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
                                              ),
                                            ),
                                          ),



                                          SizedBox(height: 10,),
                                          //Batch

                                          Padding(
                                            padding: const EdgeInsets.only(left:35.0, top:8.0, bottom:8.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText("Batch",style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead-1,
                                              ),),
                                            ),
                                          ),

                                          SizedBox(height: 5,),

                                          Padding(
                                            padding: const EdgeInsets.only(left:35.0),
                                            child: TextField(
                                              //controller: degreeList[index].variable.batch,
                                              autofocus: false,
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead,
                                              ),
                                              decoration: InputDecoration(
                                                hintText: "e.g. 21st",
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
                                          ),



                                          SizedBox(height: 10,),
                                          //Awards


                                          Padding(
                                            padding: const EdgeInsets.only(left:35.0, top:8.0, bottom:8.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText("Award",style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead-1,
                                              ),),
                                            ),
                                          ),

                                          SizedBox(height: 5,),

                                          Padding(
                                            padding: const EdgeInsets.only(left:35.0),
                                            child: TextField(
                                              autofocus: false,
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead,
                                              ),
                                              decoration: InputDecoration(
                                                hintText: "e.g. Gold Medilist",
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

                                      AutoSizeText("Add more degree(s)", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
                                        color: primaryBlue,

                                        fontWeight: FontWeight.w600
                                      ),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15,),
                              Divider(thickness: 2, color: dividerBlue,),

                                //Scholarship
                                Padding(
                                  padding: const EdgeInsets.only(top:8, bottom: 8),
                                  child: AutoSizeText("Scholarship", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                ),
                                TextField(
                                  controller: scholarship_tex,
                                  autofocus: false,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: subHead,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "e.g. Anything",
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
                                SizedBox(height: 10,),

                                //HSC
                                Padding(
                                  padding: const EdgeInsets.only(top:8, bottom: 8),
                                  child: AutoSizeText("HSC passing year", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
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

                                        hint: Text("e.g. 1996"),

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
                                          print('HSC value');
                                         // degreeMap["data"].data[index].variable.setpassingYear = val.toString();
                                          //print(degreeList[index].variable.passingYear);
                                          print(val.toString());
                                          authController.updateUI();
                                        },
                                      ),
                                    ),
                                  ),
                                ),



                                SizedBox(height: 10,),

                                //SSC

                                Padding(
                                  padding: const EdgeInsets.only(top:8, bottom: 8),
                                  child: AutoSizeText("SSC passing year", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
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

                                        hint: Text("e.g. 1996"),
                                        
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
                                          print('SSC value');
                                          // degreeMap["data"].data[index].variable.setpassingYear = val.toString();
                                          //print(degreeList[index].variable.passingYear);
                                          print(val.toString());
                                          authController.updateUI();
                                        },
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10,),

                                //Extra activities
                                Padding(
                                  padding: const EdgeInsets.only(top:8, bottom: 8),
                                  child: AutoSizeText("Extra Curricular Activities", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                ),
                                TextField(
                                  controller: extra_activity_tex,
                                  autofocus: false,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: subHead,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "e.g. Anything",
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