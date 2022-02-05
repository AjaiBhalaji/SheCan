import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shecan/configs/routes/routes.dart';
import 'package:shecan/helpers/FirebaseHelpers.dart';
import 'package:shecan/helpers/sharedPrefs.dart';
import 'package:shecan/models/Arguments.dart';
import '/constants/colorConst.dart';
import '/widgets/common/load.dart';
import '/widgets/auth/button.dart';
import '/widgets/auth/textBottom.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var _numController;
  bool isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String verificationId = '';
  String phone = '';
  int count = 0;
  @override
  void initState() {
    _numController = new TextEditingController();
    sendOTPCode();
    super.initState();
  }

  @override
  void dispose() {
    _numController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    Object? args = ModalRoute.of(context)!.settings.arguments;
    print(args);
    phone = args.toString();
    if (count == 0) {
      sendOTPCode();
      count++;
    }
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: isLoading
            ? loading()
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Verify OTP',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  //CHECK
                  SizedBox(height: 20),
                  Container(
                    height: mediaQuery.height * 0.2,
                    child: ListView(
                      children: [
                        Center(
                          child: Text(
                            'SMS Verification Code Has Been Sent To :',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(child: Text(phone)),
                        //Code

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
                          child: TextField(
                            controller: _numController,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                  ),

//last section
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // RichTextBox('Did not receive ? ', 'Resend SMS', () {
                        //   // Navigator.pushNamed(context, signUpRoute);
                        // }),
                        SizedBox(
                          height: 10,
                        ),
                        AuthButton(
                          'Verify',
                          () async {
                            //  Navigator.pushNamed(context, completeSignUpRoute);
                            signInWithPhoneAuthCredential(
                              PhoneAuthProvider.credential(
                                verificationId: verificationId,
                                smsCode: _numController.text,
                              ),
                            );
                            // setState(() {
                            //   isLoading = true;
                            // });
                            // PhoneAuthCredential phoneAuthCredential =
                            //     PhoneAuthProvider.credential(
                            //         verificationId: verificationId,
                            //         smsCode: _numController.text);

                            // signInWithPhoneAuthCredential(phoneAuthCredential);
                          },
                          mediaQuery,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      // final authCredential =
      //     await _auth.signInWithCredential(phoneAuthCredential);
      final authCredential = await FirebaseAuth.instance
          .signInWithCredential(phoneAuthCredential)
          .catchError((e) {
        print('catchError');
        _displaySnackBar(e.message);
      });
      // setState(() {
      //   isLoading = false;
      // });
      print(authCredential.user);
      if (authCredential.user != null) {
        //setKeyValue('phone', phone);
        print(authCredential.user?.uid);
        FirebaseHelpers.checkUserExists(authCredential.user?.uid).then((value) {
          _displaySnackBar("Login success");
          print(value);
          if (value) {
            FirebaseHelpers.getUser(authCredential.user?.uid).then((value) {
              SharedPrefs.setData(value).then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, homeScreenRoute, (_) => false);
              });
            });
          } else {
            Navigator.pushReplacementNamed(context, completeSignUpRoute,
                arguments: ScreenArguments(phone, authCredential.user!.uid));
          }
        });

        // checkUserExist(phone).then((value) {
        //   if (value) {
        //     setKeyValue('phone', phone);
        //     readUserNameData(phone).then((value) {
        //       setKeyValue('name', value["name"]);
        //       setKeyValue('district', value["district"]);
        //       setKeyValue('imgUrl', value["photo"]);
        //       setKeyValue('shake', 'false');
        //       setKeyValue('PoliceCount', '0'); //added on may6
        //     });
        //     DatabaseHelper().syncWithLocal();
        //     // setContactsToLocal();
        //     //nav
        //     Navigator.pushReplacementNamed(context, homeScreenRoute);
        //   } else {
        //     // Navigator.pushReplacementNamed(context, completeSignUpRoute,
        //     //     arguments: phone);
        //     Navigator.pushReplacementNamed(context, imageConsentRoute,
        //         arguments: phone);
        //   }
        // });
      }
    } catch (e) {
      // _displaySnackBar(e.message);
    }
  }

  // void setContactsToLocal() {
  //   readUserContactsData('+919655047766').then((value) {
  //     var d = (value.data());
  //     print(d);
  //     d.keys.forEach((k) {
  //       DatabaseHelper dbh = DatabaseHelper();
  //       dbh.insertContact(Contacts(k, d[k]));
  //     });
  //   });
  // }

  Future sendOTPCode() async {
    print(phone);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (phoneAuthCredential) async {
        signInWithPhoneAuthCredential(phoneAuthCredential);
        print(phoneAuthCredential.smsCode);
        setState(() {
          isLoading = false;
          _numController.text = phoneAuthCredential.smsCode;
        });
      },
      verificationFailed: (verificationFailed) async {
        if (verificationFailed.message != null) {
          _displaySnackBar(verificationFailed.message!);
        }
      },
      codeSent: (verificationId, resendingToken) {
        print('code sent');
        print(verificationId + " id is");
        if (this.mounted) {
          setState(() {
            isLoading = false;
            this.verificationId = verificationId;
          });
        }
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }

  _displaySnackBar(String res) {
    final snackBar = SnackBar(
      content: Text(
        res,
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 2),
      backgroundColor: emergencyColor,
    );
    _scaffoldKey.currentState!.showSnackBar(snackBar);
  }
}
