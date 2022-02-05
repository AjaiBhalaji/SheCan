import 'package:flutter/material.dart';

import 'package:shecan/configs/routes/routes.dart';
import 'package:shecan/helpers/FirebaseHelpers.dart';
import 'package:shecan/helpers/sharedPrefs.dart';
import '/constants/colorConst.dart';
import '/widgets/auth/button.dart';
import '/widgets/auth/textBottom.dart';
import '/widgets/common/load.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _numController;
  bool isLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _numController = TextEditingController();
    // SharedPrefs.getData().then((value) => print(value.uid));
    // FirebaseHelpers.getUser('EToYlSxtChYGcThcaZ7SFHQiYsp2');
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

    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          body: isLoading
              ? loading()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Registered Mobile No.',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 16, 20, 16),
                              child:
                                  mobileInput(numController: _numController)),
                          Text(
                            'Sign in with your mobile number',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildAuthButton(context, mediaQuery),
                          SizedBox(
                            height: 15,
                          ),
                          RichTextBox('Dont have an account ? ', 'Sign up', () {
                            Navigator.pushNamed(context, signUpRoute);
                          }),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
    );
  }

  Widget buildAuthButton(BuildContext context, Size mediaQuery) {
    return AuthButton('Continue', () {
      Navigator.pushNamed(context, otpRoute,
          arguments: '+91' + _numController.text);
      // checkUserExist('+91${_numController.text}').then((val) {
      //   if (val) {
      //     setState(() {
      //       isLoading = false;
      //     });

      //     Navigator.pushNamed(
      //       context,
      //       (otpRoute),
      //       arguments: '+91${_numController.text}',
      //     );
      //   } else {
      //     _displaySnackBar('Number Does not Exist');
      //     setState(() {
      //       isLoading = false;
      //     });
      //     //navigato to signup
      //   }
      // });
      // showSnackBar(_scaffoldKey, 'm');
      // Navigator.pushNamed(context, otpRoute);
    }, mediaQuery);
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

class mobileInput extends StatelessWidget {
  mobileInput({
    Key? key,
    @required numController,
  })  : _numController = numController,
        super(key: key);

  var _numController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
      ),
      cursorColor: Colors.blueGrey,
      maxLength: 10,
      keyboardType: TextInputType.number,
      controller: _numController,
      decoration: InputDecoration(
        prefix: Text('+91'),
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
            icon: Icon(Icons.clear), onPressed: _numController.clear),
      ),
    );
  }
}
