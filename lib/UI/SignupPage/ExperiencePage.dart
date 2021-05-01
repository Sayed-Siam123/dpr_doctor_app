import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:dpr_doctor_app/Controller/AuthController.dart';
import 'package:dpr_doctor_app/Models/SignupDegreeModel.dart' as signupModel;

import 'package:dpr_doctor_app/Models/YearModel.dart';
import "dart:ui" as ui;

import 'package:dpr_doctor_app/UI/SignupPage/SignUpHeader.dart';
import 'package:dpr_doctor_app/Utils/Constant.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class ExperiencePage extends StatelessWidget {
  List<String> yearList = [];

  List<String> specialityList = [];
  List<String> generalExperienceList = [];
  List<String> designationList = [];
  List<String> trainingList = [];



  var _selectedYear;

  // ignore: deprecated_member_use
  List<signupModel.Datum> spicilites = new List<signupModel.Datum>();
  Map<dynamic, YearModel> YearMap = new Map<dynamic, YearModel>();

  TextEditingController speciality = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    TextEditingController FromDtCtl = TextEditingController();
    TextEditingController TomDtCtl = TextEditingController();
    bool status = false;
    return GetBuilder<AuthController>(
      init: AuthController(),
      initState: (_) {
        signupModel.Datum data = new signupModel.Datum();
        spicilites.add(data);
        //YearModel datam = new YearModel(data: spicilites);
        //YearMap["data"] = datam;
        buildYearList();
        authController.updateUI();
      },
      builder: (controller) {
        return WillPopScope(
          // ignore: missing_return
          onWillPop: () {
            Get.back();
          },
          child: Scaffold(
            body: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  color: primaryBlue,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      SignupHeader(
                          constraints: constraints,
                          page: 3,
                          pagePercent: 0.75,
                          pageTitle: "Experience",
                          pageSubTitle: "Next Chamber"),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40)),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Speicilist slider

                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: AutoSizeText(
                                    "Specialties",
                                    maxFontSize: subHead,
                                    minFontSize: caption,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                //Show list of speicilites here

                                specialityList.length != 0
                                    ? Container(
                                        height: 60,
                                        width: constraints.maxWidth,
                                        color: Colors.transparent,
                                        child: ListView.builder(
                                          padding: const EdgeInsets.all(0),
                                          shrinkWrap: true,
                                          itemCount: specialityList.length,
                                          physics: ScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Container(
                                                margin:
                                                    const EdgeInsets.all(10),
                                                height: 40,
                                                width:
                                                    constraints.maxWidth / 3.5,
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: greyText)),
                                                child: FittedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: AutoSizeText(
                                                          specialityList[index],
                                                          style: TextStyle(
                                                              fontSize: h5),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 5.0),
                                                        child: IconButton(
                                                          icon: Icon(
                                                            Feather.x,
                                                            size: h5,
                                                            color: greyText,
                                                          ),
                                                          onPressed: () {
                                                            specialityList
                                                                .removeAt(
                                                                    index);
                                                            authController
                                                                .updateUI();
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ));
                                          },
                                        ),
                                      )
                                    : SizedBox(),

                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: AutoSizeText(
                                    "Add More Specialty",
                                    maxFontSize: subHead,
                                    minFontSize: caption,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                TextField(
                                  controller: speciality,
                                  autofocus: false,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: subHead,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "e.g. Psychiatry",
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        specialityList
                                            .add(speciality.text.toString());
                                        authController.updateUI();
                                      },
                                      child: Icon(FontAwesome.plus_circle),
                                    ),
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
                                SizedBox(
                                  height: 15,
                                ),
                                Divider(
                                  color: dividerBlue,
                                  thickness: 2,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                //General Experience (since)

                                ListView.builder(
                                  padding: const EdgeInsets.all(0),
                                  physics: ScrollPhysics(),
                                  itemCount: generalExperienceList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 0, bottom: 8),
                                          child: AutoSizeText(
                                            "General Experience (since)",
                                            maxFontSize: subHead,
                                            minFontSize: caption,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                          //width: 200.0,
                                          height: 60.0,

                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: Colors.blueGrey)),
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: true,
                                              child: DropdownButton<dynamic>(
                                                hint: Text("e.g. 2000"),
                                                underline: SizedBox(),
                                                isExpanded: true,
                                                value: _selectedYear,
                                                items: yearList.map((value) {
                                                  return DropdownMenuItem<
                                                      dynamic>(
                                                    value: value,
                                                    child: new Text(
                                                        value.toString()),
                                                  );
                                                }).toList(),
                                                onChanged: (val) async {
                                                  _selectedYear = val;
                                                  // print(index);
                                                  YearMap["data"]
                                                          .data[0]
                                                          .variable
                                                          .setExpYear =
                                                      val.toString();
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
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          child: AutoSizeText(
                                            "Specialized Experience in",
                                            maxFontSize: subHead,
                                            minFontSize: caption,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                  border:
                                                      new OutlineInputBorder(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          10.0),
                                                    ),
                                                    borderSide: BorderSide(
                                                        color: greyText),
                                                  ),
                                                ),
                                                textAlign: TextAlign.start,
                                                cursorColor: Colors.black87,
                                                keyboardType:
                                                    TextInputType.text,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Container(
                                                //width: 200.0,
                                                height: 61.0,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    border: Border.all(color: Colors.blueGrey)),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: ButtonTheme(
                                                    alignedDropdown: true,
                                                    child:
                                                        DropdownButton<dynamic>(
                                                      hint: Text("Since"),
                                                      underline: SizedBox(),
                                                      isExpanded: true,
                                                      value: _selectedYear,
                                                      items:
                                                          yearList.map((value) {
                                                        return DropdownMenuItem<
                                                            dynamic>(
                                                          value: value,
                                                          child: new Text(
                                                              value.toString()),
                                                        );
                                                      }).toList(),
                                                      onChanged: (val) async {
                                                        _selectedYear = val;
                                                        // print(index);
                                                        YearMap["data"]
                                                                .data[0]
                                                                .variable
                                                                .setExpYear =
                                                            val.toString();
                                                        //print(degreeList[index].variable.passingYear);
                                                        print(val.toString());
                                                        authController
                                                            .updateUI();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 10,),
                                      ],
                                    );
                                  },
                                ),

                                GestureDetector(
                                  onTap: (){
                                    generalExperienceList.add("ddad");
                                    authController.updateUI();
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8, bottom: 8),
                                    child: RichText(
                                      text: TextSpan(
                                        children: <InlineSpan>[
                                          WidgetSpan(
                                            alignment:
                                                ui.PlaceholderAlignment.middle,
                                            child: Icon(
                                              Icons.add_box_rounded,
                                              size: 24,
                                              color: primaryBlue,
                                            ),
                                          ),
                                          TextSpan(
                                              text: " Add More Experience(s)",
                                              style: TextStyle(
                                                  color: primaryBlue,
                                                  fontSize: caption,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Divider(
                                  color: dividerBlue,
                                  thickness: 2,
                                ),

//Designation
                                ListView.builder(
                                  itemCount: designationList.length,
                                  padding: const EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8, bottom: 8),
                                          child: AutoSizeText(
                                            "Designation",
                                            maxFontSize: subHead,
                                            minFontSize: caption,
                                            style:
                                            TextStyle(fontWeight: FontWeight.w600),
                                          ),
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
                                          padding:
                                          const EdgeInsets.only(top: 8, bottom: 8),
                                          child: AutoSizeText(
                                            "Institution",
                                            maxFontSize: subHead,
                                            minFontSize: caption,
                                            style:
                                            TextStyle(fontWeight: FontWeight.w600),
                                          ),
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
                                          padding:
                                          const EdgeInsets.only(top: 8, bottom: 8),
                                          child: AutoSizeText(
                                            "Major",
                                            maxFontSize: subHead,
                                            minFontSize: caption,
                                            style:
                                            TextStyle(fontWeight: FontWeight.w600),
                                          ),
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
                                            padding: const EdgeInsets.only(
                                                top: 15, bottom: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                AutoSizeText(
                                                  "Currently Working Here",
                                                  maxFontSize: h5,
                                                  minFontSize: h6,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                CustomSwitch(
                                                    activeColor: primaryBlue,
                                                    value: status,
                                                    onChanged: (value) =>
                                                    status = value),
                                              ],
                                            )),

//From date and to date
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8, bottom: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: FromDtCtl,
                                                  decoration: InputDecoration(
                                                    suffixIcon: Icon(
                                                      Icons.calendar_today,
                                                      color: Colors.black54,
                                                    ),
                                                    border: new OutlineInputBorder(
                                                      borderRadius:
                                                      const BorderRadius.all(
                                                        const Radius.circular(10.0),
                                                      ),
                                                      borderSide:
                                                      BorderSide(color: greyText),
                                                    ),
                                                    labelText: "From ",
                                                  ),
                                                  onTap: () async {
                                                    DateTime date = DateTime(1900);
                                                    FocusScope.of(context)
                                                        .requestFocus(new FocusNode());

                                                    date = await showDatePicker(
                                                        context: context,
                                                        initialDate: DateTime.now(),
                                                        firstDate: DateTime(1900),
                                                        lastDate: DateTime(2100));

                                                    FromDtCtl.text =
                                                        date.toIso8601String();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Expanded(
                                                child: TextFormField(
                                                  controller: TomDtCtl,
                                                  decoration: InputDecoration(
                                                    suffixIcon: Icon(
                                                      Icons.calendar_today,
                                                      color: Colors.grey[300],
                                                    ),
                                                    border: new OutlineInputBorder(
                                                      borderRadius:
                                                      const BorderRadius.all(
                                                        const Radius.circular(10.0),
                                                      ),
                                                      borderSide:
                                                      BorderSide(color: greyText),
                                                    ),
                                                    labelText: "To ",
                                                  ),
                                                  onTap: () async {
                                                    DateTime date = DateTime(1900);
                                                    FocusScope.of(context)
                                                        .requestFocus(new FocusNode());

                                                    date = await showDatePicker(
                                                        context: context,
                                                        initialDate: DateTime.now(),
                                                        firstDate: DateTime(1900),
                                                        lastDate: DateTime(2100));

                                                    TomDtCtl.text =
                                                        date.toIso8601String();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(height: 30,),
                                      ],
                                    );
                                  },
                                ),

                                GestureDetector(
                                  onTap: (){
                                    designationList.add("ddad");
                                    authController.updateUI();
                                  },
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                    child: RichText(
                                      text: TextSpan(
                                        children: <InlineSpan>[
                                          WidgetSpan(
                                            alignment:
                                            ui.PlaceholderAlignment.middle,
                                            child: Icon(
                                              Icons.add_box_rounded,
                                              size: 24,
                                              color: primaryBlue,
                                            ),
                                          ),
                                          TextSpan(
                                              text: " Add More Designation(s)",
                                              style: TextStyle(
                                                  color: primaryBlue,
                                                  fontSize: caption,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Divider(
                                  color: dividerBlue,
                                  thickness: 2,
                                ),


                                ExpansionTileCard(
                                  // leading: IconButton(
                                  //   onPressed: (){
                                  //     // degreeList.removeAt(index);
                                  //     // authController.updateUI();
                                  //   },
                                  //   icon: Icon(Feather.minus_circle,color: Colors.red,size: paragraph,),
                                  // ),
                                  elevation: 0,
                                  title: Text('Training/Seminar',style: TextStyle(
                                      color: Colors.black87
                                  ),),
                                  children: [
                                    //trainingList

                                    ListView.builder(
                                      itemCount: trainingList.length,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        padding: const EdgeInsets.all(0),
                                        itemBuilder: (context, index) {
                                          return ExpansionTileCard(
                                            leading: IconButton(
                                              onPressed: (){
                                                trainingList.removeAt(index);
                                                authController.updateUI();
                                              },
                                              icon: Icon(Feather.minus_circle,color: Colors.red,size: paragraph,),
                                            ),
                                            elevation: 0,
                                            title: Text('Training/Seminar',style: TextStyle(
                                                color: Colors.black87
                                            ),),
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                                  child: AutoSizeText(
                                                    "Topic",
                                                    maxFontSize: subHead,
                                                    minFontSize: caption,
                                                    style:
                                                    TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: TextField(
                                                  //controller: scholarship_tex,
                                                  autofocus: false,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: subHead,
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: "e.g. Anything",
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


                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                                  child: AutoSizeText(
                                                    "Topic Covered",
                                                    maxFontSize: subHead,
                                                    minFontSize: caption,
                                                    style:
                                                    TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: TextField(
                                                  //controller: scholarship_tex,
                                                  autofocus: false,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: subHead,
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: "e.g. Anything",
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



                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                                  child: AutoSizeText(
                                                    "Institution",
                                                    maxFontSize: subHead,
                                                    minFontSize: caption,
                                                    style:
                                                    TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: TextField(
                                                  //controller: scholarship_tex,
                                                  autofocus: false,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: subHead,
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: "e.g. Anything",
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




                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                                  child: AutoSizeText(
                                                    "Country/Region",
                                                    maxFontSize: subHead,
                                                    minFontSize: caption,
                                                    style:
                                                    TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: TextField(
                                                  //controller: scholarship_tex,
                                                  autofocus: false,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: subHead,
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: "e.g. Anything",
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



                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                                  child: AutoSizeText(
                                                    "Title",
                                                    maxFontSize: subHead,
                                                    minFontSize: caption,
                                                    style:
                                                    TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: TextField(
                                                  //controller: scholarship_tex,
                                                  autofocus: false,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: subHead,
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: "e.g. Anything",
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



                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                                  child: AutoSizeText(
                                                    "Location",
                                                    maxFontSize: subHead,
                                                    minFontSize: caption,
                                                    style:
                                                    TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: TextField(
                                                  //controller: scholarship_tex,
                                                  autofocus: false,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: subHead,
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: "e.g. Anything",
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



                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                                  child: AutoSizeText(
                                                    "Year",
                                                    maxFontSize: subHead,
                                                    minFontSize: caption,
                                                    style:
                                                    TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: TextField(
                                                  //controller: scholarship_tex,
                                                  autofocus: false,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: subHead,
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: "e.g. Anything",
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



                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                                  child: AutoSizeText(
                                                    "Duration",
                                                    maxFontSize: subHead,
                                                    minFontSize: caption,
                                                    style:
                                                    TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: TextField(
                                                  //controller: scholarship_tex,
                                                  autofocus: false,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: subHead,
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: "e.g. Anything",
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

                                            ],
                                          );
                                        },
                                    ),


                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: (){
                                          trainingList.add("ddad");
                                          authController.updateUI();
                                        },
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8, bottom: 8),
                                          child: RichText(
                                            text: TextSpan(
                                              children: <InlineSpan>[
                                                WidgetSpan(
                                                  alignment:
                                                  ui.PlaceholderAlignment.middle,
                                                  child: Icon(
                                                    Icons.add_box_rounded,
                                                    size: 24,
                                                    color: primaryBlue,
                                                  ),
                                                ),
                                                TextSpan(
                                                    text: " Add More Training(s)",
                                                    style: TextStyle(
                                                        color: primaryBlue,
                                                        fontSize: caption,
                                                        fontWeight: FontWeight.w600)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),


                                Divider(
                                  color: dividerBlue,
                                  thickness: 2,
                                ),


                                ExpansionTileCard(
                                  // leading: IconButton(
                                  //   onPressed: (){
                                  //     // degreeList.removeAt(index);
                                  //     // authController.updateUI();
                                  //   },
                                  //   icon: Icon(Feather.minus_circle,color: Colors.red,size: paragraph,),
                                  // ),
                                  elevation: 0,
                                  title: Text('Fellowship/Special Degree',style: TextStyle(
                                      color: Colors.black87
                                  ),),
                                  children: [

                                  ],
                                ),


                                Divider(
                                  color: dividerBlue,
                                  thickness: 2,
                                ),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                                    child: AutoSizeText(
                                      "Career Highlights",
                                      maxFontSize: subHead,
                                      minFontSize: caption,
                                      style:
                                      TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: TextField(
                                    //controller: scholarship_tex,
                                    autofocus: false,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: subHead,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "e.g. Anything",
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

                                // Divider(
                                //   color: dividerBlue,
                                //   thickness: 2,
                                // ),


                                SizedBox(
                                  height: 50,
                                ),

                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 50,
                                          width: constraints.maxWidth / 2.5,
                                          decoration: BoxDecoration(
                                            color: primaryBlueLight,
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                        onTap: () {
                                          Get.to(ExperiencePage());
                                        },
                                        child: Container(
                                          height: 50,
                                          width: constraints.maxWidth / 2.5,
                                          decoration: BoxDecoration(
                                            color: primaryBlue,
                                            borderRadius:
                                                BorderRadius.circular(10),
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

                                SizedBox(
                                  height: 35,
                                ),
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

  void buildYearList() {
    for (int i = 1900; i <= DateTime.now().year; i++) {
      yearList.add(i.toString());
    }
  }
}
