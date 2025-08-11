import 'package:flutter/material.dart';
import 'package:together_test/auth/emailLogin.dart';
import 'package:together_test/auth/passwordLogin.dart';
import 'package:together_test/auth/register.dart';
import 'package:together_test/bottomTabs/bottomTabs.dart';
import 'package:together_test/bottomTabs/campaigns.dart';
import 'package:together_test/bottomTabs/donate.dart';
import 'package:together_test/bottomTabs/home.dart';
import 'package:together_test/bottomTabs/more.dart';
import 'package:together_test/auth/resetPassword.dart';
import 'package:together_test/bottomTabs/programs.dart';
import 'package:together_test/dio/dio_helper.dart';
import 'package:together_test/dio/products.dart';
import 'package:together_test/more/aboutUs.dart';
import 'package:together_test/more/faq.dart';
import 'package:together_test/more/privacyPolicy.dart';
import 'package:together_test/more/subscriptions.dart';
import 'package:together_test/more/termsAndConditions.dart';
import 'package:together_test/more/transactionHistory.dart';
import 'package:together_test/orgList.dart';
import 'package:together_test/paymentMethod.dart';
import 'package:together_test/profile.dart';
import 'package:together_test/programDetails.dart';
import 'package:together_test/splash.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: {
        'orgList': (context) => OrgList(),
        'emailLogin': (context) => EmailLogin(),
        'register': (context) => Register(),
        'passwordLogin': (context) => PasswordLogin(),
        'resetPassword': (context) => ResetPassword(),
        'bottomTabs': (context) => BottomTabs(),
        'home': (context) => Home(),
        'programs': (context) => Programs(),
        'donate': (context) => Donate(),
        'campaigns': (context) => Campaigns(),
        'more': (context) => More(),
        'profile': (context) => Profile(),
        'programDetails': (context) => ProgramDetails(),
        'paymentMethod': (context) => PaymentMethod(),
        'aboutUs': (context) => AboutUs(),
        'faq': (context) => FAQ(),
        'privacyPolicy': (context) => PrivacyPolicy(),
        'termsAndConditions': (context) => TermsAndConditions(),
        'subscriptions': (context) => Subscriptions(),
        'transactionHistory': (context) => TransactionHistory(),
        'products': (context) => Products(),
      },
    );
  }
}
