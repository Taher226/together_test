import 'package:flutter/material.dart';
import 'package:together_test/features/auth/presentation/pages/emailLogin.dart';
import 'package:together_test/features/auth/presentation/pages/passwordLogin.dart';
import 'package:together_test/features/auth/presentation/pages/register.dart';
import 'package:together_test/features/common/presentation/pages/bottomTabs.dart';
import 'package:together_test/campaigns.dart';
import 'package:together_test/donate.dart';
import 'package:together_test/features/home/presentation/pages/home.dart';
import 'package:together_test/features/more/presentation/pages/more.dart';
import 'package:together_test/features/auth/presentation/pages/resetPassword.dart';
import 'package:together_test/features/programs/presentation/pages/programs.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/dio/products.dart';
import 'package:together_test/features/more/presentation/pages/aboutUs.dart';
import 'package:together_test/features/more/presentation/pages/faq.dart';
import 'package:together_test/features/more/presentation/pages/privacyPolicy.dart';
import 'package:together_test/features/more/presentation/pages/subscriptions.dart';
import 'package:together_test/features/more/presentation/pages/termsAndConditions.dart';
import 'package:together_test/features/more/presentation/pages/transactionHistory.dart';
import 'package:together_test/features/auth/presentation/pages/orgList.dart';
import 'package:together_test/features/programs/presentation/pages/paymentMethod.dart';
import 'package:together_test/features/more/presentation/pages/profile.dart';
import 'package:together_test/features/programs/presentation/pages/programDetails.dart';
import 'package:together_test/features/splash/presentation/pages/splash.dart';

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
