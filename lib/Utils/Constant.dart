import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'HexColors.dart';


//COLORS TAG START//

Color white = HexColor("#FFFFFF");//white
Color primaryBlue = HexColor("#398186");
Color greyText = HexColor("#9DAEB1");
Color progressBlue = HexColor("#062349");
Color primaryBlueLight = HexColor("#9CCECB");

//Color loader_back = HexColor("#");


//#9CCECB;

//COLORS TAG END//


//SHARED PREF KEY START//


//SHARED PREF KEY END//


//FONT SIZE START

double h1 = 40;
double h2 = 35;
double h3 = 24;
double h4 = 22;
double h5 = 20;
double subHead = 18;
double paragraph = 15;
double caption = 13;


double dLogoSize = 25;


//FONT SIZE END


//HTTPS HEADER START

//HTTPS HEADER END


// DIMENTIONS START

double status_bar = MediaQuery.of(Get.context).padding.top;

// DIMENTIONS END

class Utils {
  // String title, messageText;
  // int duration;

  DateTime backbuttonpressedTime;


  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();

    //bifbackbuttonhasnotbeenpreedOrToasthasbeenclosed
    //Statement 1 Or statement2
    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

    if (backButton) {
      backbuttonpressedTime = currentTime;
      print("Need to press double: "+backbuttonpressedTime.second.toString());
      Get.snackbar("Exit", "Double tap to exit",
          colorText: Colors.white,
          backgroundColor: Colors.black54,
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    SystemNavigator.pop();
    exit(0);
  }

  void showSnack({String title, String message, int duration, bool error=false}){
    title != null ? Get.rawSnackbar(
      titleText: Text(title.toString(),style: TextStyle(
          color: Colors.white
      ),),
      duration: Duration(seconds: duration == null? 2 : duration),
      messageText: Text(message.toString(),style: TextStyle(
          color: Colors.white
      ),),
      backgroundColor: Colors.black54,
      snackPosition: SnackPosition.TOP,
    ) : Get.rawSnackbar(
      duration: Duration(seconds: duration == null? 2 : duration),
      messageText: Text(message.toString(),style: TextStyle(
          color: Colors.white
      ),),
      backgroundColor: error == false ? Colors.green.shade500.withOpacity(0.7) : Colors.red.shade400.withOpacity(1),
      snackPosition: SnackPosition.TOP,
    );
  }

  HideKeyboard() {
    FocusScope.of(Get.overlayContext).requestFocus(new FocusNode());
  }

  Widget ErrorText({text,size}){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(text.toString(),
        style: TextStyle(
          color: Colors.red,
          fontSize: size,
        ),),
    );
  }

  Widget appBar(){
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.blue,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivering to"),
          Text("sasas")
        ],
      ),
      leading: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(7,12,7,12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: white)
        ),
        child: IconButton(
          onPressed: (){

          },
          icon: Icon(Icons.menu),
        ),
      ),
    );
  }

  Widget textView({String text,double size,double minSize,FontWeight weight,double maxSize,Color color}){
    return AutoSizeText(
      text.toString(),
      style: TextStyle(
        fontWeight: weight == null ? FontWeight.normal : weight,
        color: color == null ? null : color,
        fontSize: size == null ? null : size,
      ),
      maxFontSize: maxSize == null ? null : maxSize,
    );
  }

  AppBar insidepageAppbar({title,searchStatus}) {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0.0,
      leadingWidth: 80,
      title: Text(
        title.toString(),
        style: TextStyle(color: white),
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: Icon(
            Feather.arrow_left,
            color: white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      actions: [
        searchStatus == true ? LayoutBuilder(
          builder: (context, constraints) => GestureDetector(
            onTap: () {

            },
            child: Container(
              color: Colors.transparent,
              height: constraints.maxHeight * 1.2,
              width: constraints.maxHeight * 1.2,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Feather.search,
                      color: white,
                    ),
                  ),

                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Icon(
                  //     Feather.shopping_cart,
                  //     color: addtoCartButtonColor,
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 40,
                  //   top: 12,
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: Container(
                  //       height: 15,
                  //       width: 15,
                  //       decoration: BoxDecoration(
                  //           shape: BoxShape.circle, color: Colors.red),
                  //       child: Center(
                  //         child: Text(
                  //           "1",
                  //           style: TextStyle(
                  //             fontSize: h5,
                  //             color: white,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ) : SizedBox(height: 0,width: 0,),
      ],
    );
  }
}