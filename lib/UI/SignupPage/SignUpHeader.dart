import 'package:auto_size_text/auto_size_text.dart';
import 'package:dpr_doctor_app/UI/SignupPage/ChamberPage.dart';
import 'package:dpr_doctor_app/UI/SignupPage/EducationPage.dart';
import 'package:dpr_doctor_app/UI/SignupPage/ExperiencePage.dart';
import 'package:dpr_doctor_app/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget SignupHeader({BoxConstraints constraints,double pagePercent,String pageTitle,String pageSubTitle,int page}){
  return Positioned(
    top: 0,
    height: 200,
    width: constraints.maxWidth,
    child: Container(
      color: primaryBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: constraints.maxWidth/1.5,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(pageTitle,style: TextStyle(
                    color: white,
                    fontSize: h1,
                  ),),
                  AutoSizeText(pageSubTitle,style: TextStyle(
                    color: white,
                    fontSize: h5,
                  ),),
                ],
              ),
            ),
          ),



          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: white,
                    shape: BoxShape.circle
                ),
                child: CircularPercentIndicator(
                  radius: 90.0,
                  lineWidth: 8.0,
                  animation: true,
                  percent: pagePercent,
                  backgroundColor: Colors.grey.shade300,
                  center: new Text(
                    "${page.toString()}/4",
                    style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: progressBlue,
                ),
              ),

              SizedBox(width: 10,),

              GestureDetector(
                onTap: (){
                  if(page == 1){
                    Get.to(EducationPage());
                  }
                  else if(page == 2){
                    Get.to(ExperiencePage());
                  }
                  else if(page == 3){
                    Get.to(ChamberPage());
                  }
                },
                child: page != 4 ? Container(
                  height: 80,
                  width: 20,
                  decoration: BoxDecoration(
                      color: progressBlue.withOpacity(0.4),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                  ),
                  child: Center(
                    child: Icon(EvilIcons.chevron_right,size: h3,color: white,),
                  ),
                ) : SizedBox(width: 20,),
              ),
            ],
          ),
        ],
      ),


    ),
  );
}