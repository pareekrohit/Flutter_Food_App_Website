import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/home.dart';
import 'package:flutter_demo/utils/MyColors.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var name = "";
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      // Fluttertoast.showToast(
      //     msg: "Login successful",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     textColor: Colors.white,
      //     backgroundColor: const Color(0xFFac1291),
      //     fontSize: 16.0);
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
                        color: Color(0xFF000000),
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
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                        style: TextButton.styleFrom(
                            minimumSize: const Size(160, 45),
                            backgroundColor: MyColors.mainColor),
                        onPressed: () {
                          moveToHome(context);
                        },
                        child: const Text('Login')),
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
          child: Scaffold(backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            body: Form(
              key: _formKey,
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/login.png',
                              fit: BoxFit.contain,
                              height: 600,
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
                                fontFamily: 'oswald',
                              ),
                            ),
                            Text(
                              "Welcome $name",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF000000),
                                fontFamily: 'oswald',
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        )),

                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 350,
                              child:
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Enter Email",
                                  labelStyle: const TextStyle(
                                      color: Color(0xD0000000)),

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
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            SizedBox(
                              width: 350,
                              child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Enter password",
                                labelStyle:
                                TextStyle(color: Color(0xD0000000)),
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
                            ),),


                            const SizedBox(height: 40),


                            ElevatedButton(
                                style: TextButton.styleFrom(
                                    minimumSize: const Size(160, 45),
                                    backgroundColor: MyColors.mainColor),
                                onPressed: () {
                                  moveToHome(context);
                                },
                                child: const Text('Login')),
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
        ));
  }
}
