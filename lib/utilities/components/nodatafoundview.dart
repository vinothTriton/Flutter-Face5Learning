import 'package:flutter/material.dart';
import 'package:face5/utilities/app_color.dart';
import 'package:face5/utilities/assestpath.dart';
import 'package:face5/utilities/common.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssestPath.nodatafoundimage,
            width: 200, // Adjust the width as needed
            height: 200, // Adjust the height as needed
          ),
          SizedBox(height: 20),
          Text(
            "No Data Found",
            style: TextStyle(
                fontSize: CommonFont.largefontsize,
                fontFamily: Fontname.Poppins,
                fontWeight: FontWeight.w400,
                color: AppColor.blackcolor),
          ),
        ],
      ),
    );
  }
}
