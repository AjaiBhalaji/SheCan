import 'package:flutter/material.dart';
import 'package:shecan/configs/routes/routes.dart';
import 'package:shecan/helpers/FirebaseHelpers.dart';
import 'package:shecan/helpers/sharedPrefs.dart';
import 'package:shecan/models/Arguments.dart';
import 'package:shecan/models/user_profile.dart';
import 'package:shecan/widgets/auth/button.dart';
import '/constants/colorConst.dart';
import '/widgets/auth/button.dart';
import '/widgets/common/load.dart';

class CompleteSignUpPage extends StatefulWidget {
  @override
  _CompleteSignUpPageState createState() => _CompleteSignUpPageState();
}

class _CompleteSignUpPageState extends State<CompleteSignUpPage> {
  final _nameController = new TextEditingController();
  final _ageController = new TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final phone = args.phone;
    final uid = args.uid;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            CompleteSignUpText(),
                            PaddedText(titleText: 'Your Name'),
                            PaddedTextField(
                              controller: _nameController,
                            ),
                            PaddedText(titleText: 'Phone'),
                            PaddedMobileField(
                              mobile: phone,
                            ),
                            PaddedText(titleText: 'Age'),
                            PaddedTextField(
                              controller: _ageController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //AuthButton
                //
                isLoading
                    ? loading()
                    : AuthButton('Sign Up', () async {
                        if (_nameController.text.isEmpty ||
                            _ageController.text.isEmpty) {
                          // Fluttertoast.showToast(
                          //     msg: 'Please fill all the fields',
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.BOTTOM,
                          //     timeInSecForIosWeb: 1,
                          //     backgroundColor: Colors.red,
                          //     textColor: Colors.white,
                          //     fontSize: 16.0);
                        } else {
                          final user = UserProfile(
                            uid: uid,
                            name: _nameController.text,
                            phone: phone,
                            age: _ageController.text,
                          );
                          await FirebaseHelpers.addUser(user);
                          await SharedPrefs.setData(user);
                          Navigator.pushNamedAndRemoveUntil(
                              context, homeScreenRoute, (_) => false);
                        }
                        //create user and set sessions pref ,navigate to home
                      }, mediaQuery),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompleteSignUpText extends StatelessWidget {
  const CompleteSignUpText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
      child: Text(
        'Complete Your Sign Up',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
    );
  }
}

class PaddedTextField extends StatelessWidget {
  final controller;
  PaddedTextField({@required this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        controller: controller,
      ),
    );
  }
}

class PaddedMobileField extends StatelessWidget {
  final mobile;
  PaddedMobileField({@required this.mobile});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          hintText: mobile,
        ),
      ),
    );
  }
}

class PaddedText extends StatelessWidget {
  final titleText;
  PaddedText({@required this.titleText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Text(
        titleText,
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
