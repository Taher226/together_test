import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_test/core/utils/form_validators.dart';
import 'package:together_test/core/widgets/otpModal.dart';
import 'package:together_test/features/auth/data/repositories/login_repository.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/features/auth/presentation/bloc/login/login_bloc.dart';

class PasswordLogin extends StatefulWidget {
  @override
  State<PasswordLogin> createState() => _PasswordLoginState();
}

class _PasswordLoginState extends State<PasswordLogin> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController passwordController = TextEditingController();
  bool isPasswordChecked = true;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return BlocProvider(
      create: (context) => LoginBloc(LoginRepository()),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.of(context).pushReplacementNamed(
                'bottomTabs',
                arguments: {"token": state.token},
              );
              debugPrint("✅ TOKENNNNN: ${state.token}");
            } else if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.error0,
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return Center(child: CircularProgressIndicator());
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/handsForCharity.png',
                            height: 61,
                            width: 96,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16, bottom: 8),
                            child: Text(
                              'Log in to your account',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: AppColors.neutral0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            'Enter your password to log in',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.neutral30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
                            child: Text(
                              'password',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: AppColors.neutral30,
                              ),
                            ),
                          ),

                          Form(
                            key: formKey,
                            child: TextFormField(
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              validator:
                                  (value) =>
                                      FormValidators.validatePassword(value),
                              controller: passwordController,
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
                                    color: AppColors.primary,
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
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  print('ARGSSSSSSSSSSS ${args['email']}');
                                  showOtpBottomSheet();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Forgot Password ?',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                if (!formKey.currentState!.validate()) return;
                                BlocProvider.of<LoginBloc>(context).add(
                                  LoginRequestEvent(
                                    email: args['email'],
                                    password: passwordController.text,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Login',
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
              ],
            );
          },
        ),
      ),
    );
  }
  //////////////////////////otp modal/////////////////////////////

  showOtpBottomSheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return OtpModal(
          onPress: (otpCode) {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('resetPassword');
          },
        );
      },
    );
  }
}
