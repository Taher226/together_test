import 'package:flutter/material.dart';
import 'package:together_test/components/auth/screenLayout.dart';
import 'package:together_test/constants/colors.dart';

class EmailLogin extends StatefulWidget {
  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      centerAlignment: true,
      children: [
        Image.asset('images/handsForCharity.png', height: 61, width: 96),
        Container(
          margin: EdgeInsets.only(top: 16, bottom: 8),
          child: Text(
            'Welcome',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: AppColors.neutral0,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        Text(
          'Log in to Hands For Charity to continue',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.neutral30,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Text(
            'Email',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.neutral30,
            ),
          ),
        ),
        TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },

          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.placeholder, width: 1),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primary, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.error0, width: 1),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('passwordLogin');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.neutral100,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Or',
                style: TextStyle(
                  color: AppColors.neutral40,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),

        Container(
          margin: EdgeInsets.only(top: 25),

          width: double.infinity,
          height: 48,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Image.asset('images/googleIcon.png', height: 20, width: 20),
            label: Text(
              'Log In With Google',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.neutral30,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: AppColors.neutral20, width: 1),
              ),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 15),
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed('register');
            },
            icon: Icon(Icons.apple, size: 25, color: Colors.black),
            label: Text(
              'Log In With Apple',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.neutral30,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.neutral100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: AppColors.neutral20, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
