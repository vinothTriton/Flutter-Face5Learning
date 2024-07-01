import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:face5/utilities/app_color.dart';
import 'package:face5/utilities/spacerwidget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CommonFont {
  static double bigFontSize = 25;
  static double largefontsize = 20;
  static double mediumfontsize = 16;
  static double smallfontsize = 14;
}

class Fontname {
  static String Poppins = 'Poppins';
}

class CommonContentString {
  static String BaseAPIUrl = 'http://18.61.82.213:3000/api';
  static String imageBaseAPIUrl = 'http://18.61.82.213:3000/api';
  static String error = "Something went wrong please try again...";
  static String networknotavailabel =
      'Oops! There seems to be an issue with your internet connection. Please check your connectivity';
  static String capitalize(String s) {
    if (s.isEmpty) {
      return '';
    }
    if (s[0] == s[0].toUpperCase()) {
      return s;
    }
    return s[0].toUpperCase() + (s.length > 1 ? s.substring(1) : '');
  }
}

class InternetConnect {
  static final Connectivity _connectivity = Connectivity();
  static Future<bool> checkInternetConnectivity() async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}

class Loader {
  static final Load = LoadingAnimationWidget.threeArchedCircle(
    color: AppColor.primary,
    size: 50,
  );

  static final loginLoad = LoadingAnimationWidget.halfTriangleDot(
    color: AppColor.whitecolor,
    size: 25,
  );

  static final circleLoader = LoadingAnimationWidget.inkDrop(
    color: AppColor.primary,
    size: 35,
  );
}

class Toastmessage {
  // ignore: non_constant_identifier_namesßs
  static errorshowToast(String Message) {
    Fluttertoast.showToast(
      msg: Message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 3,
      backgroundColor: AppColor.redcolor,
      textColor: AppColor.whitecolor,
      fontSize: CommonFont.mediumfontsize,
    );
  }

  static successshowToast(String Message) {
    Fluttertoast.showToast(
      msg: Message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 3,
      backgroundColor: AppColor.primary,
      textColor: AppColor.whitecolor,
      fontSize: CommonFont.mediumfontsize,
    );
  }
}

class CommonAlertDialog {
  static void showConfirmationDialog(BuildContext context, String title,
      String content, Function onYesPressed, Function onCancelledPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
                fontFamily: Fontname.Poppins,
                fontSize: CommonFont.mediumfontsize,
                fontWeight: FontWeight.bold),
          ),
          content: Text(content,
              style: TextStyle(
                  fontFamily: Fontname.Poppins,
                  fontSize: CommonFont.smallfontsize,
                  fontWeight: FontWeight.w500)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onCancelledPressed();
              },
              child: Text('No',
                  style: TextStyle(
                      fontFamily: Fontname.Poppins,
                      color: AppColor.redcolor,
                      fontSize: CommonFont.mediumfontsize,
                      fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onYesPressed();
              },
              child: Text('Yes',
                  style: TextStyle(
                      fontFamily: Fontname.Poppins,
                      color: AppColor.primary,
                      fontSize: CommonFont.mediumfontsize,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  static void showimagepickerDialog(
      BuildContext context,
      String title,
      String content,
      Function onYesPressed,
      Function onCancelledPressed,
      String Buttontitle1,
      String Buttontitle2,
      bool isDocument) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
                fontFamily: Fontname.Poppins,
                fontSize: CommonFont.mediumfontsize,
                fontWeight: FontWeight.bold),
          ),
          content: Text(content,
              style: TextStyle(
                  fontFamily: Fontname.Poppins,
                  fontSize: CommonFont.smallfontsize,
                  fontWeight: FontWeight.w500)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    onCancelledPressed();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo_sharp,
                        color: AppColor.primary,
                      ),
                      SpacerWidget.size4w,
                      Text(Buttontitle1,
                          style: TextStyle(
                              fontFamily: Fontname.Poppins,
                              color: AppColor.primary,
                              fontSize: CommonFont.mediumfontsize,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    onYesPressed();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isDocument
                            ? Icons.file_present_sharp
                            : Icons.camera_alt,
                        color: AppColor.primary,
                      ),
                      SpacerWidget.size4w,
                      Text(Buttontitle2,
                          style: TextStyle(
                              fontFamily: Fontname.Poppins,
                              color: AppColor.primary,
                              fontSize: CommonFont.mediumfontsize,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            isDocument
                ? TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cancel,
                          color: AppColor.redcolor,
                        ),
                        SpacerWidget.size4w,
                        Text('Cancel',
                            style: TextStyle(
                                fontFamily: Fontname.Poppins,
                                color: AppColor.redcolor,
                                fontSize: CommonFont.mediumfontsize,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        );
      },
    );
  }

  static void showimagepickerDialogone(
      BuildContext context,
      String title,
      String content,
      Function onCancelledPressed,
      String Buttontitle2,
      bool isDocument) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
                fontFamily: Fontname.Poppins,
                fontSize: CommonFont.mediumfontsize,
                fontWeight: FontWeight.bold),
          ),
          content: Text(content,
              style: TextStyle(
                  fontFamily: Fontname.Poppins,
                  fontSize: CommonFont.smallfontsize,
                  fontWeight: FontWeight.w500)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // TextButton(
                //   onPressed: () {
                //     onCancelledPressed();
                //   },
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(
                //         Icons.photo_sharp,
                //         color: AppColor.primary,
                //       ),
                //       SpacerWidget.size4w,
                //       Text(Buttontitle1 ?? "",
                //           style: TextStyle(
                //               fontFamily: Fontname.Poppins,
                //               color: AppColor.primary,
                //               fontSize: CommonFont.mediumfontsize,
                //               fontWeight: FontWeight.bold)),
                //     ],
                //   ),
                // ),
                TextButton(
                  onPressed: () {
                    onCancelledPressed();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isDocument
                            ? Icons.file_present_sharp
                            : Icons.camera_alt,
                        color: AppColor.primary,
                      ),
                      SpacerWidget.size4w,
                      Text(Buttontitle2,
                          style: TextStyle(
                              fontFamily: Fontname.Poppins,
                              color: AppColor.primary,
                              fontSize: CommonFont.mediumfontsize,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            isDocument
                ? TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cancel,
                          color: AppColor.redcolor,
                        ),
                        SpacerWidget.size4w,
                        Text('Cancel',
                            style: TextStyle(
                                fontFamily: Fontname.Poppins,
                                color: AppColor.redcolor,
                                fontSize: CommonFont.mediumfontsize,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        );
      },
    );
  }
}
