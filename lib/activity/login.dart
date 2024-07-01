import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/loginmodel.dart';
import '../service_file/auth_service.dart';
import '../utilities/app_color.dart';
import '../utilities/assestpath.dart';
import '../utilities/common.dart';
import '../utilities/spacerwidget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _obscureText = true;
  String _selectedRole = '';
  bool isLoading = false;
  LoginData? getUserData;
  late AuthService authservice;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController userNameTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();

  @override
  void initState() {
    super.initState();
    authservice = context.read<AuthService>();
  }

  login(userID, passwordText, userType) async {
    setState(() {
      isLoading = true;
    });

    try {
      LoginModel loginData =
          await authservice.login(userID, passwordText, userType);
      if (loginData.message == "Success") {
        getUserData = loginData.data;
        print(getUserData?.firstName);
        Toastmessage.successshowToast(loginData.message ?? "");
        setState(() {
          isLoading = false;
        });
      } else {
        Toastmessage.errorshowToast(loginData.message ?? "");
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      Toastmessage.errorshowToast(CommonContentString.error);
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whitecolor,
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              SpacerWidget.large,
              Padding(
                padding: const EdgeInsets.only(
                  top: 80.0,
                  bottom: 80.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Image(
                  image: AssetImage(AssestPath.appLogo),
                  height: 81,
                  width: 253,
                ),
              ),
              SpacerWidget.large,
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: CommonFont.bigFontSize,
                      fontFamily: Fontname.Poppins,
                      fontWeight: FontWeight.bold,
                      color: AppColor.summarycolor),
                ),
              ),
              SpacerWidget.large,
              Container(
                padding: const EdgeInsets.only(left: 20.0, bottom: 4.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "User name / Email",
                  style: TextStyle(
                      fontSize: CommonFont.mediumfontsize,
                      fontFamily: Fontname.Poppins,
                      fontWeight: FontWeight.w500,
                      color: AppColor.textPrimary),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  style: TextStyle(
                      fontFamily: Fontname.Poppins,
                      fontSize: CommonFont.mediumfontsize,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackcolor),
                  controller: userNameTC,
                  validator: (value) {
                    if (value == "") {
                      return "Please Enter your ID to Login";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "User name / Email",
                      contentPadding: EdgeInsets.all(5),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(width: 1, color: AppColor.primary)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              width: 0.5, color: AppColor.greycolor))),
                ),
              ),
              SpacerWidget.large,
              Container(
                padding: const EdgeInsets.only(left: 20.0, bottom: 4.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                      fontSize: CommonFont.mediumfontsize,
                      fontFamily: Fontname.Poppins,
                      fontWeight: FontWeight.w500,
                      color: AppColor.textPrimary),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  obscureText: _obscureText,
                  style: TextStyle(
                      fontFamily: Fontname.Poppins,
                      fontSize: CommonFont.mediumfontsize,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackcolor),
                  controller: passwordTC,
                  validator: (value) {
                    if (value == "") {
                      return "Please Enter Password to Login";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password_rounded),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColor.greycolor,
                          )),
                      hintText: "Password",
                      contentPadding: EdgeInsets.all(5),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(width: 1, color: AppColor.primary)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              width: 0.5, color: AppColor.greycolor))),
                ),
              ),
              SpacerWidget.large,
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 20.0, right: 20.0, bottom: 8.0),
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      login(userNameTC.text, passwordTC.text,
                          _selectedRole.toLowerCase());
                    }
                  },
                  child: Container(
                    height: 54,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.whitecolor),
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.primary),
                    child: Center(
                      child: isLoading
                          ? Loader.loginLoad
                          : Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: CommonFont.mediumfontsize,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Fontname.Poppins,
                                  color: AppColor.whitecolor),
                            ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
