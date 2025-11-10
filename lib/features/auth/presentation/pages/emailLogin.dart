import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_test/core/utils/form_validators.dart';
import 'package:together_test/features/auth/data/repositories/check_email_repository_impl.dart';
import 'package:together_test/features/auth/domain/useCases/check_email_useCase.dart';
import 'package:together_test/features/auth/presentation/bloc/checkEmail/check_email_bloc.dart';
import 'package:together_test/core/config/theme/colors.dart';

class EmailLogin extends StatefulWidget {
  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              CheckEmailBloc(CheckEmailUseCase(CheckEmailRepositoryImpl())),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: BlocConsumer<CheckEmailBloc, CheckEmailState>(
          listener: (context, state) {
            if (state is CheckEmailSuccess) {
              if (state.entity.success == true) {
                Navigator.pushNamed(
                  context,
                  "passwordLogin",
                  arguments: {'email': emailController.text},
                );
              } else if (state.entity.success == false) {
                Navigator.pushNamed(
                  context,
                  "register",
                  arguments: {'email': emailController.text},
                );
              }
            } else if (state is CheckEmailError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            if (state is CheckEmailLoading) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.neutral100,
                  color: AppColors.primary,
                ),
              );
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
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
                            child: Text(
                              'Email',
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
                                      FormValidators.validateEmail(value),
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: AppColors.primary,
                              decoration: InputDecoration(
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
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: AppColors.error0,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                if (!formKey.currentState!.validate()) return;
                                context.read<CheckEmailBloc>().add(
                                  CheckEmailRequestEvent(
                                    emailController.text.trim(),
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
                              icon: Image.asset(
                                'images/googleIcon.png',
                                height: 20,
                                width: 20,
                              ),
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
                                  side: BorderSide(
                                    color: AppColors.neutral20,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 15),
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.apple,
                                size: 25,
                                color: Colors.black,
                              ),
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
                                  side: BorderSide(
                                    color: AppColors.neutral20,
                                    width: 1,
                                  ),
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
}
