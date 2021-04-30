import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:dpr_doctor_app/Controller/AuthController.dart';
import 'package:dpr_doctor_app/Models/SignupDegreeModel.dart';
import 'package:dpr_doctor_app/UI/SignupPage/SignUpHeader.dart';
import 'package:dpr_doctor_app/Utils/Constant.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import "dart:ui" as ui;
import 'package:percent_indicator/circular_percent_indicator.dart';

class ChamberPage extends StatelessWidget {

  List<Datum> degreeList = new List<Datum>();

  Map<dynamic,DegreeDataModel> degreeMap = new Map<dynamic,DegreeDataModel>();

  List<String> district = ["Dhaka","Chittagong","Rajshahi","Barishal"];
  List<String> thana = ["Polton","Mirpur","Banani","Uttara"];


  String selectedDistrict,selectedThana;


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
                      SignupHeader(constraints: constraints,page: 4,pagePercent: 1,pageTitle: "Chamber",pageSubTitle: "Almost Done!"),
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
                                        title: Text('Chamber ${index+1}*'),
                                        children: [
                                          ExpansionTileCard(
                                            elevation: 0,
                                            borderRadius: BorderRadius.circular(10),
                                            title: Text("Address"),
                                            children: [
                                              SizedBox(height: 5,),

                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: AutoSizeText("Road No. / Holding No.",style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: subHead-1,
                                                  ),),
                                                ),
                                              ),

                                              TextField(
                                                autofocus: false,
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: subHead,
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: "Address",
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

                                              SizedBox(height: 5,),

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: AutoSizeText("District",style: TextStyle(
                                                              color: Colors.black87,
                                                              fontSize: subHead-1,
                                                            ),),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 60,
                                                          decoration: BoxDecoration(
                                                            border: Border.all(color: greyText),
                                                            borderRadius: const BorderRadius.all(
                                                              const Radius.circular(10.0),
                                                            ),
                                                            color: white,
                                                          ),
                                                          alignment: Alignment.center,
                                                          padding: const EdgeInsets.all(5),
                                                          child: DropdownButton<dynamic>(
                                                            hint: Text("Select District*"),
                                                            underline: SizedBox(),
                                                            isExpanded: true,
                                                            value: selectedDistrict,
                                                            items: district.map((value) {
                                                              return DropdownMenuItem<dynamic>(
                                                                value: value,
                                                                child: new Text(value.toString()),
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) async{
                                                              print(val.name.toString());
                                                              selectedDistrict = val;
                                                              authController.updateUI();
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(width: 30,),


                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: AutoSizeText("Sub District*",style: TextStyle(
                                                              color: Colors.black87,
                                                              fontSize: subHead-1,
                                                            ),),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 60,
                                                          decoration: BoxDecoration(
                                                            border: Border.all(color: greyText),
                                                            borderRadius: const BorderRadius.all(
                                                              const Radius.circular(10.0),
                                                            ),
                                                            color: white,
                                                          ),
                                                          alignment: Alignment.center,
                                                          padding: const EdgeInsets.all(5),
                                                          child: DropdownButton<dynamic>(
                                                            hint: Text("Select Thana"),
                                                            underline: SizedBox(),
                                                            isExpanded: true,
                                                            value: selectedDistrict,
                                                            items: district.map((value) {
                                                              return DropdownMenuItem<dynamic>(
                                                                value: value,
                                                                child: new Text(value.toString()),
                                                              );
                                                            }).toList(),
                                                            onChanged: (val) async{
                                                              print(val.name.toString());
                                                              selectedDistrict = val;
                                                              authController.updateUI();
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                              ),


                                              SizedBox(height: 5,),


                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: AutoSizeText("Floor number",style: TextStyle(
                                                              color: Colors.black87,
                                                              fontSize: subHead-1,
                                                            ),),
                                                          ),
                                                        ),

                                                        TextField(
                                                          autofocus: false,
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: subHead,
                                                          ),
                                                          decoration: InputDecoration(
                                                            hintText: "Address",
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
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(width: 30,),


                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: AutoSizeText("Floor number",style: TextStyle(
                                                              color: Colors.black87,
                                                              fontSize: subHead-1,
                                                            ),),
                                                          ),
                                                        ),

                                                        TextField(
                                                          autofocus: false,
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: subHead,
                                                          ),
                                                          decoration: InputDecoration(
                                                            hintText: "Address",
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
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 5,),
                                            ],
                                          ),

                                          SizedBox(height: 15,),
                                          Divider(thickness: 2, color: dividerBlue,),

                                          //Institution
                                          SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.only(left:0.0, top:8.0, bottom:8.0),

                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText("Visiting Fee",style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead-1,
                                              ),),
                                            ),
                                          ),

                                          SizedBox(height: 5,),

                                          Padding(
                                            padding: const EdgeInsets.only(left:0.0),
                                            child: TextField(
                                              //controller: degreeList[index].variable.institution,
                                              autofocus: false,
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead,
                                              ),
                                              decoration: InputDecoration(
                                                hintText: "Fees",
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

                                          ExpansionTileCard(
                                            elevation: 0,
                                            borderRadius: BorderRadius.circular(10),
                                            title: Text("Set Visiting Fee Rule(s)"),
                                            children: [
                                              SizedBox(height: 5,),

                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: AutoSizeText("Appointment Again Within  ",style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: subHead-1,
                                                  ),),
                                                ),
                                              ),

                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        TextField(
                                                          autofocus: false,
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: subHead,
                                                          ),
                                                          decoration: InputDecoration(
                                                            hintText: "Days",
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
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(width: 30,),


                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        TextField(
                                                          autofocus: false,
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: subHead,
                                                          ),
                                                          decoration: InputDecoration(
                                                            hintText: "Fees",
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
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 10,),

                                              GestureDetector(
                                                onTap: (){

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

                                                    AutoSizeText("Add more rules(s)", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
                                                        color: primaryBlue,

                                                        fontWeight: FontWeight.w600
                                                    ),),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),


                                          SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.only(left:0.0, top:8.0, bottom:8.0),

                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText("Report Show Fee ",style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead-1,
                                              ),),
                                            ),
                                          ),

                                          SizedBox(height: 5,),

                                          Padding(
                                            padding: const EdgeInsets.only(left:0.0),
                                            child: TextField(
                                              //controller: degreeList[index].variable.institution,
                                              autofocus: false,
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead,
                                              ),
                                              decoration: InputDecoration(
                                                hintText: "Fees",
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

                                          ExpansionTileCard(
                                            elevation: 0,
                                            borderRadius: BorderRadius.circular(10),
                                            title: Text("Set Report Show Fee Rule(s)"),
                                            children: [
                                              SizedBox(height: 5,),

                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: AutoSizeText("Report Show Within ",style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: subHead-1,
                                                  ),),
                                                ),
                                              ),

                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        TextField(
                                                          autofocus: false,
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: subHead,
                                                          ),
                                                          decoration: InputDecoration(
                                                            hintText: "Days",
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
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(width: 30,),


                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        TextField(
                                                          autofocus: false,
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: subHead,
                                                          ),
                                                          decoration: InputDecoration(
                                                            hintText: "Fees",
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
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 10,),

                                              GestureDetector(
                                                onTap: (){

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

                                                    AutoSizeText("Add more rules(s)", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
                                                        color: primaryBlue,

                                                        fontWeight: FontWeight.w600
                                                    ),),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: 15,),
                                          Divider(thickness: 2, color: dividerBlue,),

                                          //Passing year
                                          SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.only(left:0.0, top:8.0, bottom:8.0),

                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText("Time Slot(s)*",style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: subHead-1,
                                              ),),
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Divider(thickness: 2, color: greyText.withOpacity(0.5),),


                                          SizedBox(height: 10,),


                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomSwitch(
                                                  activeColor: primaryBlue,
                                                  value: true,
                                                  onChanged: (value) => value = !value
                                              ),

                                              SizedBox(width: 30,),

                                              Expanded(
                                                  child: Container(
                                                    height: 60,
                                                    color: Colors.transparent,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          margin: const EdgeInsets.all(11),
                                                          width: 70,
                                                          decoration: BoxDecoration(
                                                            color: Colors.transparent,
                                                            borderRadius: BorderRadius.circular(10),
                                                            border: Border.all(color: greyText),
                                                          ),
                                                          child: Center(
                                                            child: TextField(

                                                              autofocus: false,
                                                              style: TextStyle(
                                                                color: Colors.black87,
                                                                fontSize: subHead,
                                                              ),
                                                              decoration: InputDecoration(
                                                                enabledBorder: InputBorder.none,
                                                                focusedBorder: InputBorder.none,
                                                                hintText: "From",
                                                              ),
                                                              textAlign: TextAlign.center,
                                                              cursorColor: Colors.black87,
                                                              readOnly: true,
                                                              onTap: (){

                                                              },
                                                            ),
                                                          ),
                                                        ),


                                                        SizedBox(width: 10,),
                                                        Text("to"),
                                                        SizedBox(width: 10,),
                                                        Container(
                                                          margin: const EdgeInsets.all(11),
                                                          width: 70,
                                                          decoration: BoxDecoration(
                                                            color: Colors.transparent,
                                                            borderRadius: BorderRadius.circular(10),
                                                            border: Border.all(color: greyText),
                                                          ),
                                                          child: Center(
                                                            child: TextField(

                                                              autofocus: false,
                                                              style: TextStyle(
                                                                color: Colors.black87,
                                                                fontSize: subHead,
                                                              ),
                                                              decoration: InputDecoration(
                                                                enabledBorder: InputBorder.none,
                                                                focusedBorder: InputBorder.none,
                                                                hintText: "To",
                                                              ),
                                                              textAlign: TextAlign.center,
                                                              cursorColor: Colors.black87,
                                                              readOnly: true,
                                                              onTap: (){

                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Icon(Feather.plus,size: h5,),
                                                        SizedBox(width: 10,),
                                                      ],
                                                    ),
                                                  ),
                                              ),

                                            ],
                                          ),


                                          // Padding(
                                          //   padding: const EdgeInsets.only(left:35.0, top:8.0, bottom:8.0),
                                          //   child: Align(
                                          //     alignment: Alignment.centerLeft,
                                          //     child: AutoSizeText("Batch",style: TextStyle(
                                          //       color: Colors.black87,
                                          //       fontSize: subHead-1,
                                          //     ),),
                                          //   ),
                                          // ),
                                          //
                                          // SizedBox(height: 5,),
                                          //
                                          // Padding(
                                          //   padding: const EdgeInsets.only(left:35.0),
                                          //   child: TextField(
                                          //     //controller: degreeList[index].variable.batch,
                                          //     autofocus: false,
                                          //     style: TextStyle(
                                          //       color: Colors.black87,
                                          //       fontSize: subHead,
                                          //     ),
                                          //     decoration: InputDecoration(
                                          //       hintText: "e.g. 21st",
                                          //       border: new OutlineInputBorder(
                                          //         borderRadius: const BorderRadius.all(
                                          //           const Radius.circular(10.0),
                                          //         ),
                                          //         borderSide: BorderSide(color: greyText),
                                          //       ),
                                          //     ),
                                          //     textAlign: TextAlign.start,
                                          //     cursorColor: Colors.black87,
                                          //     keyboardType: TextInputType.number,
                                          //   ),
                                          // ),
                                          //
                                          //
                                          //
                                          // SizedBox(height: 10,),
                                          // //Awards
                                          //
                                          //
                                          // Padding(
                                          //   padding: const EdgeInsets.only(left:35.0, top:8.0, bottom:8.0),
                                          //   child: Align(
                                          //     alignment: Alignment.centerLeft,
                                          //     child: AutoSizeText("Award",style: TextStyle(
                                          //       color: Colors.black87,
                                          //       fontSize: subHead-1,
                                          //     ),),
                                          //   ),
                                          // ),
                                          //
                                          // SizedBox(height: 5,),
                                          //
                                          // Padding(
                                          //   padding: const EdgeInsets.only(left:35.0),
                                          //   child: TextField(
                                          //     autofocus: false,
                                          //     style: TextStyle(
                                          //       color: Colors.black87,
                                          //       fontSize: subHead,
                                          //     ),
                                          //     decoration: InputDecoration(
                                          //       hintText: "e.g. Gold Medilist",
                                          //       border: new OutlineInputBorder(
                                          //         borderRadius: const BorderRadius.all(
                                          //           const Radius.circular(10.0),
                                          //         ),
                                          //         borderSide: BorderSide(color: greyText),
                                          //       ),
                                          //     ),
                                          //     textAlign: TextAlign.start,
                                          //     cursorColor: Colors.black87,
                                          //     keyboardType: TextInputType.number,
                                          //   ),
                                          // ),


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

                                      AutoSizeText("Add more chamber(s)", maxFontSize: subHead, minFontSize: caption, style: TextStyle(
                                          color: primaryBlue,
                                          fontWeight: FontWeight.w600
                                      ),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Divider(thickness: 2, color: dividerBlue,),

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
                                          //Get.to(ExperiencePage());
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