import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shecan/views/auth/otp_view.dart';

import 'configs/routes/routes.dart';
import 'helpers/sharedPrefs.dart';
import 'views/auth/complete_signup.dart';
import 'views/auth/login_view.dart';
import 'views/auth/signup_view.dart';
import 'views/home/HomePage.dart';
import 'models/user_profile.dart';
import 'views/jobs/job_home.dart';
import 'views/others/community.dart';
import 'views/others/get_help.dart';
import 'views/others/health_page.dart';
import 'views/others/jobs.dart';
import 'views/others/know_rights.dart';
import 'views/others/learn.dart';
import 'views/others/profile.dart';
import 'widgets/jobs/bottomsheet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyBottomSheetModel>(
        create: (_) => MyBottomSheetModel(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: Colors.pink.shade200,
            primarySwatch: Colors.pink,
          ),
          home: const Decider(),
          routes: {
            signInRoute: (ctx) => LoginPage(),
            signUpRoute: (ctx) => SignUpPage(),
            completeSignUpRoute: (ctx) => CompleteSignUpPage(),
            otpRoute: (ctx) => OTPScreen(),
            homeScreenRoute: (ctx) => HomePage(),
            profileRoute: (ctx) => ProfilePage(),
            healthRoute: (ctx) => HealthPage(),
            getHelpRoute: (ctx) => GethelpPage(),
            learnRoute: (ctx) => LearnPage(),
            jobsRoute: (ctx) => HomeScreen(),
            knowRightsRoute: (ctx) => KnowRightsPage(),
            communityRoute: (ctx) => CommunityPage(),
          },
        ));
  }
}

class Decider extends StatelessWidget {
  const Decider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPrefs.getData(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            UserProfile? prof = snapshot.data as UserProfile?;
            return prof!.uid == 'null' ? LoginPage() : HomePage();
          } else {
            return LoginPage();
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
