import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_test/core/utils/form_validators.dart';
import 'package:together_test/core/widgets/otpModal.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/core/staticData/data.dart';
import 'package:together_test/features/auth/data/repositories/send_otp_repository.dart';
import 'package:together_test/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:together_test/features/auth/presentation/bloc/register/register_state.dart';
import 'package:together_test/features/auth/presentation/bloc/sendOtp/send_otp_bloc.dart';
import 'package:together_test/features/auth/presentation/bloc/sendOtp/send_otp_event.dart';
import 'package:together_test/features/auth/presentation/bloc/sendOtp/send_otp_state.dart';
import 'package:together_test/features/auth/presentation/bloc/verifyEmail/verify_email_bloc.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isPasswordChecked = true;
  bool isResetPasswordChecked = true;
  bool termsCheck = true;
  bool termsSubtitleCheck = true;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? selectedCountry;
  String? selectedProvince;
  SendOtpRepository sendOtpRepository = SendOtpRepository();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    emailController.text = args['email'] ?? '';
    showOtpBottomSheet() {
      return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return OtpModal(
            onPress: (otpCode) {
              debugPrint("✅ OTP entered: $otpCode");
              context.read<VerifyEmailBloc>().add(
                VerifyEmailRequestEvent(
                  email: emailController.text,
                  otp: otpCode,
                ),
              );
            },
          );
        },
      );
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterBloc, RegisterState>(
          listener: (context, abc) {
            // if (state is RegisterLoading) {
            //   setState(() => isLoading = true);
            // } else {
            //   setState(() => isLoading = false);
            // }

            if (abc is RegisterSuccess) {
              final sendOtpEvent = SendOtpSubmittedEvent(
                email: emailController.text,
              );
              context.read<SendOtpBloc>().add(sendOtpEvent);
              debugPrint("✅ SEND OTP DETAILS: ${sendOtpEvent.email}");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("✅ Registered successfully, ${abc.message}"),
                ),
              );
            }

            if (abc is RegisterError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Register Failed : ${abc.error}")),
              );
            }
          },
        ),
        BlocListener<SendOtpBloc, SendOtpState>(
          listener: (context, state) {
            if (state is SendOtpSuccess) {
              showOtpBottomSheet();
            }

            if (state is SendOtpError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
        ),
        BlocListener<VerifyEmailBloc, VerifyEmailState>(
          listener: (context, stat) {
            if (stat is VerifyEmailSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("✅ Email verified successfully")),
              );
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(
                'bottomTabs',
                arguments: {'data': stat.model.data},
              );
            }

            if (stat is VerifyEmailError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(stat.message)));
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
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
                          margin: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          child: Text(
                            'Create New Account',
                            style: TextStyle(
                              color: AppColors.neutral0,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 3),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 5,
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        'First Name',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.neutral30,
                                        ),
                                      ),
                                    ),

                                    TextFormField(
                                      validator:
                                          (value) =>
                                              FormValidators.validateName(
                                                value,
                                                isLastName: false,
                                              ),
                                      controller: firstNameController,
                                      onTapOutside: (event) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      cursorColor: AppColors.primary,
                                      decoration: InputDecoration(
                                        hintText: 'first name',
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColors.placeholder,
                                            width: 1,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColors.placeholder,
                                            width: 1,
                                          ),
                                        ),

                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColors.primary,
                                            width: 1,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColors.error0,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 5,
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        'Last Name',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.neutral30,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      validator:
                                          (value) =>
                                              FormValidators.validateName(
                                                value,
                                                isLastName: true,
                                              ),

                                      controller: lastNameController,
                                      onTapOutside: (event) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      cursorColor: AppColors.primary,
                                      decoration: InputDecoration(
                                        hintText: 'last name',
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColors.placeholder,
                                            width: 1,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColors.placeholder,
                                            width: 1,
                                          ),
                                        ),

                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColors.primary,
                                            width: 1,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColors.error0,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 10,
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
                              TextFormField(
                                validator:
                                    (value) =>
                                        FormValidators.validateEmail(value),

                                controller: emailController,
                                onTapOutside: (event) {
                                  FocusScope.of(context).unfocus();
                                },
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: AppColors.primary,
                                decoration: InputDecoration(
                                  hintText: 'email address',
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
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: AppColors.error0,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 10,
                                ),
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.neutral30,
                                  ),
                                ),
                              ),
                              TextFormField(
                                validator:
                                    (value) =>
                                        FormValidators.validatePassword(value),
                                controller: passwordController,
                                onTapOutside: (event) {
                                  FocusScope.of(context).unfocus();
                                },
                                obscureText: isPasswordChecked,
                                cursorColor: AppColors.primary,
                                decoration: InputDecoration(
                                  hintText: 'password',
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
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: AppColors.error0,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 5),
                                child: Text(
                                  'Password must be at least 6 characters including a lowercase letter, an uppercase letter, and a number',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.neutral40,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(bottom: 10),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 10,
                                ),
                                child: Text(
                                  'Confirm Password',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.neutral30,
                                  ),
                                ),
                              ),
                              TextFormField(
                                validator:
                                    (value) =>
                                        FormValidators.validateConfirmPassword(
                                          value,
                                          passwordController.text,
                                        ),
                                controller: confirmPasswordController,
                                onTapOutside: (event) {
                                  FocusScope.of(context).unfocus();
                                },
                                obscureText: isResetPasswordChecked,
                                cursorColor: AppColors.primary,
                                decoration: InputDecoration(
                                  hintText: 'Confirm password',
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isResetPasswordChecked =
                                            !isResetPasswordChecked;
                                      });
                                    },
                                    icon: Icon(
                                      isResetPasswordChecked
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
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: AppColors.error0,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 10,
                                ),
                                child: Text(
                                  'Address (Optional)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.neutral0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 3),

                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.45,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 5,
                                      ),

                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              'Country',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.neutral30,
                                              ),
                                            ),
                                          ),
                                          DropdownButtonFormField<String>(
                                            value: selectedCountry,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                                borderSide: BorderSide(
                                                  color: AppColors.placeholder,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                                borderSide: BorderSide(
                                                  color: AppColors.placeholder,
                                                ),
                                              ),
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            items:
                                                countries.map((country) {
                                                  return DropdownMenuItem<
                                                    String
                                                  >(
                                                    value: country.value,
                                                    child: Text(country.label),
                                                  );
                                                }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                selectedCountry = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.45,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 5,
                                      ),

                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              'Province',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.neutral30,
                                              ),
                                            ),
                                          ),
                                          DropdownButtonFormField<String>(
                                            value: selectedProvince,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                                borderSide: BorderSide(
                                                  color: AppColors.placeholder,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                                borderSide: BorderSide(
                                                  color: AppColors.placeholder,
                                                ),
                                              ),
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            items:
                                                provinces.map((province) {
                                                  return DropdownMenuItem<
                                                    String
                                                  >(
                                                    value: province.value,
                                                    child: Text(province.label),
                                                  );
                                                }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                selectedProvince = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 3),

                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.45,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 5,
                                      ),

                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              'City',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.neutral30,
                                              ),
                                            ),
                                          ),

                                          TextFormField(
                                            controller: cityController,
                                            onTapOutside: (event) {
                                              FocusScope.of(context).unfocus();
                                            },
                                            cursorColor: AppColors.primary,
                                            decoration: InputDecoration(
                                              hintText: 'City',
                                              contentPadding: EdgeInsets.all(
                                                10,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: AppColors.placeholder,
                                                  width: 1,
                                                ),
                                              ),

                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: AppColors.primary,
                                                  width: 1,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: AppColors.error0,
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.45,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 5,
                                      ),

                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              'Postal Code',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.neutral30,
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: postalCodeController,
                                            onTapOutside: (event) {
                                              FocusScope.of(context).unfocus();
                                            },
                                            cursorColor: AppColors.primary,
                                            decoration: InputDecoration(
                                              hintText: 'Postal Code',
                                              contentPadding: EdgeInsets.all(
                                                10,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: AppColors.placeholder,
                                                  width: 1,
                                                ),
                                              ),

                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: AppColors.primary,
                                                  width: 1,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: AppColors.error0,
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 10,
                                ),
                                child: Text(
                                  'Address',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.neutral30,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: addressController,

                                onTapOutside: (event) {
                                  FocusScope.of(context).unfocus();
                                },
                                cursorColor: AppColors.primary,
                                decoration: InputDecoration(
                                  hintText: 'address',
                                  contentPadding: EdgeInsets.all(10),
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
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    termsCheck = !termsCheck;
                                  });
                                },
                                child:
                                    termsCheck == true
                                        ? Icon(
                                          Icons.check_box,
                                          color: AppColors.primary,
                                        )
                                        : Icon(
                                          Icons.check_box_outline_blank,
                                          color: AppColors.primary,
                                        ),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  'I Agree ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.neutral20,
                                  ),
                                ),
                              ),
                              Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  termsSubtitleCheck = !termsSubtitleCheck;
                                });
                              },
                              child:
                                  termsSubtitleCheck == true
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
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  'I agree that this app is powered by the Together Platform, and by registering, I authorize the use of my credentials for seamless and secure sign-in across all Together-powered apps.',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.neutral20,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 5,
                          ),
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed:
                                isLoading
                                    ? null
                                    : () {
                                      if (formKey.currentState!.validate()) {
                                        if (termsCheck == false ||
                                            termsSubtitleCheck == false) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              backgroundColor: AppColors.error0,
                                              content: Text(
                                                'Please agree to the terms and conditions',
                                                style: TextStyle(
                                                  color: AppColors.neutral100,
                                                ),
                                              ),
                                            ),
                                          );
                                          return;
                                        }

                                        final registerEvent =
                                            RegisterSubmittedEvent(
                                              email:
                                                  emailController.text.trim(),
                                              firstName:
                                                  firstNameController.text
                                                      .trim(),
                                              lastName:
                                                  lastNameController.text
                                                      .trim(),
                                              password:
                                                  passwordController.text
                                                      .trim(),
                                              passwordConfirmation:
                                                  confirmPasswordController.text
                                                      .trim(),
                                              city: cityController.text.trim(),
                                              postalCode:
                                                  postalCodeController.text
                                                      .trim(),
                                              address:
                                                  addressController.text.trim(),
                                              countryId: 1,
                                              stateId: 1,
                                            );
                                        context.read<RegisterBloc>().add(
                                          registerEvent,
                                        );

                                        debugPrint(
                                          "✅ REGISTER DETAILS: $registerEvent",
                                        );
                                      }
                                    },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child:
                                isLoading
                                    ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                    : Text(
                                      'Continue',
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
        ),
      ),
    );
  }

  void onContinuePressed() {
    // debugPrint('🔍 [RegistrationPage] Sending registration OTP request: $request');
  }
}
