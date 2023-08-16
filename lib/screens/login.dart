
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_demo/api/apiService.dart';
import 'package:flutter_demo/api/api_constant.dart';
import 'package:flutter_demo/model/login/LoginResponse.dart';
import 'package:flutter_demo/screens/home.dart';
import 'package:flutter_demo/utils/MyColors.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var name = "";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  moveToHome() async {
    if (_formKey.currentState!.validate()) {
      /*Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));*/
      setState(() {
        _isLoading = true;
      });

      LoginResponse? loginResp;
      loginResp = await ApiService()
          .loginApi(emailController.text, passwordController.text);

      setState(() {
        _isLoading = false;
      });

      if (loginResp?.status == true) {
        var sharePref = await SharedPreferences.getInstance();
        try{
          sharePref.setBool(ApiConstant.login, true);
          sharePref.setString(
              ApiConstant.name, {loginResp?.data?.user?.name} as String);
          sharePref.setString(
              ApiConstant.email, {loginResp?.data?.user?.email} as String);
          sharePref.setString(
              ApiConstant.token, {loginResp?.data?.user?.token} as String);


        }catch(e){
          log("Exception ${e.toString()}");
        }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      } else {
        Fluttertoast.showToast(
            msg: "Login Failed",
            toastLength: Toast.LENGTH_LONG,
            textColor: Colors.white,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 4,
            webBgColor: '#FF0000',
            webPosition: 'left',
            fontSize: 18.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const breakpoint = 600.0;

    if (screenWidth >= breakpoint) {
      return _getWebView();
    } else {
      return _getMobileView();
    }
  }

  Widget _getMobileView() {
    return Material(
      color: Colors.white,
      child: SafeArea(
        //scrollview
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/login.png',
                      fit: BoxFit.contain,
                      height: 300,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Never have a bad meal",
                      style: TextStyle(
                        fontSize: 25,
                        color: MyColors.mainColor,
                        fontFamily: 'wosald',
                      ),
                    ),
                    Text(
                      "Welcome $name",
                      style: const TextStyle(
                        fontSize: 18,
                        color: MyColors.mainColor,
                        fontFamily: 'oswald',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter Email",
                              labelStyle:
                                  const TextStyle(color: Color(0xD0000000)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                  color: MyColors.mainColor,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            style: const TextStyle(fontSize: 18),
                            onChanged: (value) =>
                                {name = value, setState(() {})},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email field should not be empty";
                              }

                              if (!checkEmail(value)) {
                                return 'Please enter valid Email';
                              }
                              return null;
                            },
                            controller: emailController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter password",
                              labelStyle: TextStyle(color: Color(0xD0000000)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                  color: MyColors.mainColor,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            style: const TextStyle(fontSize: 18),
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password field should not be empty";
                              }
                              return null;
                            },
                            controller: passwordController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    /* ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30), // <-- Radius
                            ),backgroundColor: MyColors.mainColor)*/ /*TextButton.styleFrom(
                            minimumSize: const Size(200, 45),
                            backgroundColor: MyColors.mainColor)*/ /*,
                        onPressed: () {
                          moveToHome(context);
                        },
                        child: const Text('Login11')),*/
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getWebView() {
    return Material(
        color: Colors.white,
        child: SafeArea(
          //scrollview
          child: Scaffold(
            //backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            body: Container(
              // color: MyColors.mainColor,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login_bg.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Form(
                key: _formKey,
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Card(
                                elevation: 15,
                                color: Colors.white,
                                shadowColor: MyColors.mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: MyColors.black,
                                            fontFamily: 'wosald',
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 340,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: "Enter Email",
                                            labelStyle: const TextStyle(
                                                color: Color(0xD0000000),
                                                fontSize: 14,
                                                letterSpacing: 2),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              borderSide: const BorderSide(
                                                color: MyColors.mainColor,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                          onChanged: (value) =>
                                              {name = value, setState(() {})},
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Email field should not be empty";
                                            }

                                            if (!checkEmail(value)) {
                                              return 'Please enter valid Email';
                                            }
                                            return null;
                                          },
                                          controller: emailController,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 340,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: "Enter password",
                                            labelStyle: TextStyle(
                                                color: Color(0xD0000000),
                                                fontSize: 14,
                                                letterSpacing: 2),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              borderSide: const BorderSide(
                                                color: MyColors.mainColor,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          style: const TextStyle(fontSize: 18),
                                          obscureText: true,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Password field should not be empty";
                                            }

                                            return null;
                                          },
                                          controller: passwordController,
                                        ),
                                      ),
                                      const SizedBox(height: 40),
                                      _isLoading
                                          ? const CircularProgressIndicator()
                                          : ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  fixedSize: Size(200, 40),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30), // <-- Radius
                                                  ),
                                                  backgroundColor:
                                                      MyColors.mainColor),
                                              onPressed: () {
                                                moveToHome();
                                              },
                                              child: const Text('Login')),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: MyColors.mainColor,
                                              fontFamily: 'wosald',
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              /*Image.asset(
                                'assets/images/login.png',
                                fit: BoxFit.contain,
                                height: 600,
                                width: double.infinity,
                              ),*/
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Never have a bad meal",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: MyColors.white,
                                  fontFamily: 'oswald',
                                ),
                              ),
                              Text(
                                "Welcome $name",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: MyColors.white,
                                  fontFamily: 'oswald',
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
