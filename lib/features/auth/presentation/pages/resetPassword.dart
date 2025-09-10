import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/core/utils/form_validators.dart';
import 'package:together_test/features/auth/presentation/bloc/resetPassword/reset_password_bloc.dart';

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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.success0,
                content: Text(state.model.message ?? "Password changed!"),
              ),
            );
            Navigator.of(context).pushReplacementNamed('emailLogin');
          } else if (state is ResetPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.error0,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ResetPasswordLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 120),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 32),
                  decoration: BoxDecoration(
                    color: AppColors.neutral100,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
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
                            validator:
                                (value) =>
                                    FormValidators.validatePassword(value),
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
                                  isPasswordChecked
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.placeholder,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.placeholder,
                                  width: 1,
                                ),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.primary,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
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
                            validator:
                                (value) =>
                                    FormValidators.validateConfirmPassword(
                                      value,
                                      newPasswordController.text,
                                    ),
                            controller: reEnterPasswordController,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: AppColors.primary,
                            obscureText: isReEnterPasswordChecked,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isReEnterPasswordChecked =
                                        !isReEnterPasswordChecked;
                                  });
                                },
                                icon: Icon(
                                  isReEnterPasswordChecked
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.placeholder,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.placeholder,
                                  width: 1,
                                ),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.primary,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
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
                                          ? Icon(
                                            Icons.check_box,
                                            color: AppColors.primary,
                                          )
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
                                if (formKey.currentState!.validate()) {
                                  if (checkBox == false) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: AppColors.warning0,
                                        content: Text(
                                          'Please mark the checkbox to proceed',
                                          style: TextStyle(
                                            color: AppColors.neutral100,
                                          ),
                                        ),
                                      ),
                                    );
                                    return;
                                  }
                                  context.read<ResetPasswordBloc>().add(
                                    ResetPasswordRequestEvent(
                                      email: args['email'],
                                      otp: int.parse(args['otp']),
                                      password: newPasswordController.text,
                                      passwordConfirmation:
                                          reEnterPasswordController.text,
                                    ),
                                  );
                                }
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
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
