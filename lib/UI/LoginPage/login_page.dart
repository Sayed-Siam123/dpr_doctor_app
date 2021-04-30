import 'package:auto_size_text/auto_size_text.dart';
import 'package:dpr_doctor_app/Controller/AuthController.dart';
import 'package:dpr_doctor_app/UI/SignupPage/signup_page.dart';
import 'package:dpr_doctor_app/Utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final TextEditingController user_phone_ctrl = TextEditingController();
    final TextEditingController user_pass_ctrl = TextEditingController();
    final bottm_pad =50.0;
    print(bottom);
    return GetBuilder<AuthController>(
      init: AuthController(),
      initState: (_){
        authController.showPass = false;
        authController.updateUI();
      },
      builder: (controller) {
        return WillPopScope(
          // ignore: missing_return
          onWillPop: (){
            //Get.back();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
           // resizeToAvoidBottomPadding: false,
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  reverse: true,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: bottom>0?bottom-bottm_pad:0.0),
                    child: Container(
                      color: primaryBlue,
                      child: Column(
                        children: [
                          Container(
                            color: primaryBlue,
                            padding: const EdgeInsets.all(25),
                            width: constraints.maxWidth,
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height:80,),
                                AutoSizeText("Hello Doctor,",style: TextStyle(
                                  color: white,
                                  fontSize: h6,
                                ),),
                                AutoSizeText("Sign In",style: TextStyle(
                                  color: white,
                                  fontSize: h1,
                                ),),
                                SizedBox(height: 20,)
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText("Phone number",style: TextStyle(
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
                                    controller: user_phone_ctrl,
                                    autofocus: false,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: subHead,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "+8801675646312",
                                     // border: OutlineInputBorder(
                                      //    borderSide: new BorderSide(color: Colors.grey)),

                                    //  enabledBorder: InputBorder.none,
                                     // errorBorder: InputBorder.none,
                                    //  disabledBorder: InputBorder.none,
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
                                    controller: user_pass_ctrl,
                                    autofocus: false,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: subHead,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "*********",
                                     // border: InputBorder.none,
                                    //  focusedBorder: InputBorder.none,
                                     // enabledBorder: InputBorder.none,
                                    //  errorBorder: InputBorder.none,
                                    //  disabledBorder: InputBorder.none,
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

                                SizedBox(height: 20,),

                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      AutoSizeText("Forgot password?",style: TextStyle(
                                          color: Colors.grey.shade600.withOpacity(0.6),
                                          fontSize: paragraph,
                                        fontWeight: FontWeight.w600,
                                      ),),

                                      SizedBox(height: 25,),

                                      Container(
                                        height: 50,
                                        width: constraints.maxWidth,
                                        decoration: BoxDecoration(
                                          color: primaryBlue,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: AutoSizeText(
                                            "Log In",
                                            style: TextStyle(
                                              fontSize: subHead,
                                              color: white,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: 30,),

                                      AutoSizeText("Don't have an account?",style: TextStyle(
                                        color: Colors.grey.shade600.withOpacity(0.6),
                                        fontSize: paragraph,
                                        fontWeight: FontWeight.w600,
                                      ),),

                                      SizedBox(height: 5,),

                                      InkWell(
                                        onTap: (){
                                          Get.to(SignupPage());
                                        },
                                        child: AutoSizeText("Sign Up",style: TextStyle(
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
                        ],
                      ),
                    ),
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
