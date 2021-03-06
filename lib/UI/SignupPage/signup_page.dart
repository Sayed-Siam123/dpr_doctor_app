import 'package:auto_size_text/auto_size_text.dart';
import 'package:dpr_doctor_app/Controller/AuthController.dart';
import 'package:dpr_doctor_app/UI/LoginPage/login_page.dart';
import 'package:dpr_doctor_app/UI/SignupPage/personal_info_page.dart';
import 'package:dpr_doctor_app/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
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
                  color:primaryBlue,
                  child: Column(
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          color: primaryBlue,
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height:80,),
                              AutoSizeText("Welcome Doctor,",style: TextStyle(
                                color: white,
                                fontSize: paragraph,
                              ),),
                              AutoSizeText("Sign Up",style: TextStyle(
                                color: white,
                                fontSize: h1,
                              ),),
                              SizedBox(height:20,),
                            ],
                          ),
                        ),
                      ),

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
                                AutoSizeText("Name",style: TextStyle(
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
                                      hintText: "Enter name here",
                                      //border: InputBorder.none,
                                      //focusedBorder: InputBorder.none,
                                      //enabledBorder: InputBorder.none,
                                     // errorBorder: InputBorder.none,
                                     // disabledBorder: InputBorder.none,
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

                                      GestureDetector(
                                        onTap: (){
                                          Get.to(PersonalInfoPage());
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

                                      SizedBox(height: 30,),

                                      Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            AutoSizeText("Already have an account?",style: TextStyle(
                                              color: Colors.grey.shade600.withOpacity(0.6),
                                              fontSize: paragraph,
                                              fontWeight: FontWeight.w600,
                                            ),),

                                            SizedBox(height: 5,),

                                            InkWell(
                                              onTap: (){
                                                Get.to(LoginPage());
                                              },
                                              child: AutoSizeText("Sign in",style: TextStyle(
                                                color: primaryBlue,
                                                fontSize: paragraph,
                                                fontWeight: FontWeight.w600,
                                              ),),
                                            ),

                                          ],
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
