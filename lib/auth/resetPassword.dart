import 'package:flutter/material.dart';
import 'package:together_test/components/auth/screenLayout.dart';
import 'package:together_test/constants/colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool checkBox = true;
  bool isPasswordChecked = true;
  bool isReEnterPasswordChecked = true;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      centerAlignment: false,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8),
          child: Text(
            'Create New Password',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.neutral0,
            ),
          ),
        ),
        Text(
          'Enter your new password',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.neutral20,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Text(
            'New Password',
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
          controller: newPasswordController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: AppColors.primary,
          obscureText: isPasswordChecked,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPasswordChecked = !isPasswordChecked;
                });
              },
              icon: Icon(
                isPasswordChecked ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            contentPadding: EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.placeholder, width: 1),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primary, width: 1),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Text(
            'Re- Enter New Password',
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
          controller: reEnterPasswordController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: AppColors.primary,
          obscureText: isReEnterPasswordChecked,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isReEnterPasswordChecked = !isReEnterPasswordChecked;
                });
              },
              icon: Icon(
                isReEnterPasswordChecked
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
            contentPadding: EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.placeholder, width: 1),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primary, width: 1),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          // color: Colors.amber,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    checkBox = !checkBox;
                  });
                },
                child:
                    checkBox == true
                        ? Icon(Icons.check_box, color: AppColors.primary)
                        : Icon(
                          Icons.check_box_outline_blank,
                          color: AppColors.primary,
                        ),
              ),

              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    'Require all devices to sign in with new password',

                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.neutral40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('passwordLogin');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Confirm',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.neutral100,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
