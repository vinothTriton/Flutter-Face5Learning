import 'package:flutter/material.dart';
import 'package:face5/utilities/app_color.dart';
import 'package:face5/utilities/assestpath.dart';
import 'package:face5/utilities/common.dart';

class InternetCheckView extends StatelessWidget {
  final VoidCallback onPressed;
  final Color buttonBordercolor;
  final Color buttonTextfontcolor;
  final Color? Textcolor;
  final Color? imageColor;

  const InternetCheckView(
      {Key? key,
      required this.onPressed,
      required this.buttonBordercolor,
      required this.buttonTextfontcolor,
      this.imageColor,
      this.Textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(),
          Image.asset(
            AssestPath.nowifi,
            width: 200, // Adjust the width as needed
            height: 200,
            color: AppColor.primary, // Adjust the height as needed
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              CommonContentString.networknotavailabel,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: CommonFont.mediumfontsize,
                  fontFamily: Fontname.Poppins,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primary ?? AppColor.blackcolor),
            ),
          ),
          Spacer(),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: buttonBordercolor),
                ),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              "Refresh",
              style: TextStyle(
                fontFamily: Fontname.Poppins,
                fontSize: CommonFont.mediumfontsize,
                color: buttonTextfontcolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
