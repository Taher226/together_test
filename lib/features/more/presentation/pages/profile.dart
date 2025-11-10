import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_test/core/widgets/otpModal.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/features/more/presentation/bloc/changeEmail/change_email_bloc.dart';
import 'package:together_test/features/more/presentation/bloc/changePassword/change_password_bloc.dart';
import 'package:together_test/features/more/presentation/bloc/checkPassword/check_password_bloc.dart';
import 'package:together_test/features/more/presentation/bloc/editProfile/edit_profile_bloc.dart';
import 'package:together_test/features/more/presentation/bloc/resetEmail/reset_email_bloc.dart';
import 'package:together_test/features/more/presentation/widgets/changeEmailModal.dart';
import 'package:together_test/features/more/presentation/widgets/changePasswordModal.dart';

import 'package:together_test/features/more/presentation/widgets/profileSection.dart';
import 'package:together_test/features/more/presentation/widgets/saveModal.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isEditMode = false;
  bool isPasswordChecked = true;
  bool isChangePasswordError = false;
  var passwordError;
  //////////////////MODALS VARIABLES/////////////////////////////////
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController changeCurrentPasswordController =
      TextEditingController();
  TextEditingController changeNewPasswordController = TextEditingController();
  TextEditingController changeReEnterPasswordController =
      TextEditingController();

  TextEditingController newEmailController = TextEditingController();
  bool isCurrentPasswordTrue = false;
  bool isNewEmailTrue = false;
  bool isChangeCurrentPasswordTrue = false;

  late Map args;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController addressController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as Map;
    firstNameController = TextEditingController(text: args['firstName']);
    lastNameController = TextEditingController(text: args['lastName']);
    addressController = TextEditingController(text: args['address']);
    emailController = TextEditingController(text: args['email']);
    phoneNumberController = TextEditingController(text: args['phone']);
    passwordController = TextEditingController(text: 'sssssssssssssss');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.neutral100,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.neutral10,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('images/backIcon.png', width: 32, height: 32),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocListener<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileSuccess) {
            setState(() {
              openSaveChangesModal(context);
            });
          }
        },
        child: BlocBuilder<EditProfileBloc, EditProfileState>(
          builder: (context, state) {
            if (state is EditProfileLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            } else if (state is EditProfileFailure) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyle(color: AppColors.error0),
                ),
              );
            }
            return Container(
              width: double.infinity,
              color: Color(0xFFF4FCFF),
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor:
                                args['photoUrl'] != null
                                    ? Colors.white
                                    : AppColors.neutral100,
                            backgroundImage:
                                args['photoUrl'] != null
                                    ? NetworkImage(args['photoUrl'].toString())
                                    : null,

                            child:
                                args['photoUrl'] == null
                                    ? Icon(
                                      Icons.person,
                                      size: 56,
                                      color: AppColors.primary,
                                    )
                                    : null,
                          ),

                          SizedBox(height: 10),
                          isEditMode == true
                              ? InkWell(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      size: 16,
                                      color: AppColors.primary,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Change photo',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              : SizedBox.shrink(),
                          SizedBox(height: 20),
                          ProfileSection(
                            isEditMode: isEditMode,
                            hasSecondInput: true,
                            firstLabel: 'First Name',
                            firstHint: 'first name',
                            secondLabel: 'Last Name',
                            secondHint: 'last name',
                            secondController: lastNameController,
                            firstController: firstNameController,
                          ),
                          SizedBox(height: 30),

                          ProfileSection(
                            isEditMode: isEditMode,
                            firstLabel: 'Address',
                            firstHint: 'address',
                            firstController: addressController,
                          ),
                          SizedBox(height: 30),
                          ProfileSection(
                            isEditMode: isEditMode,
                            firstLabel: 'Email',
                            firstHint: 'email',
                            firstController: emailController,
                            firstSuffix: InkWell(
                              onTap: () {
                                openEnterPasswordModal();
                              },
                              child: Text(
                                'Change',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 30),
                          ProfileSection(
                            isEditMode: isEditMode,
                            firstLabel: 'Phone Number (Optional)',
                            firstHint: 'Phone Number',
                            firstController: phoneNumberController,
                          ),

                          SizedBox(height: 30),
                          ProfileSection(
                            isEditMode: isEditMode,
                            firstLabel: 'Password',
                            firstHint: 'Password',
                            firstController: passwordController,
                            isPasswordText: isPasswordChecked,
                            firstSuffixIcon:
                                isEditMode
                                    ? Container(
                                      margin: EdgeInsets.only(right: 11),
                                      padding: EdgeInsets.only(top: 14),
                                      child: InkWell(
                                        onTap: () {
                                          openChangePasswordModal();
                                        },
                                        child: Text(
                                          'Change',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    )
                                    : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isPasswordChecked =
                                              !isPasswordChecked;
                                        });
                                      },
                                      icon: Icon(
                                        isPasswordChecked
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: AppColors.neutral100,
                    child:
                        isEditMode == false
                            ? Container(
                              margin: EdgeInsets.all(20),
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {
                                  debugPrint('arguments : $args');
                                  setState(() {
                                    isEditMode = true;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.neutral100,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                            : Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.all(20),
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.55,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.read<EditProfileBloc>().add(
                                          EditProfileRequestEvent(
                                            'patch',
                                            firstNameController.text,
                                            lastNameController.text,
                                            phoneNumberController.text,
                                            addressController.text,
                                            args['token'],
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Save Changes',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.neutral100,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 20,
                                      horizontal: 10,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          isEditMode = false;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.neutral100,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          side: BorderSide(
                                            color: AppColors.primary,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  openEnterPasswordModal() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BlocConsumer<CheckPasswordBloc, CheckPasswordState>(
          listener: (context, state) {
            if (state is CheckPasswordSuccess) {
              Navigator.pop(context);
              openChangeEmailModal();
            }
            if (state is CheckPasswordFailure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.error0,
                  content: Text(
                    state.error.toString(),
                    style: TextStyle(color: AppColors.neutral100),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is CheckPasswordLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }
            return ChangeEmailModal(
              title: 'Enter your password',
              subTitle: 'Please enter your current password to proceed',
              inputTitle: 'Current Password',
              controller: currentPasswordController,
              onPress: () {
                context.read<CheckPasswordBloc>().add(
                  CheckPasswordRequestEvent(
                    token: args['token'],
                    password: currentPasswordController.text,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  openChangeEmailModal() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BlocConsumer<ChangeEmailBloc, ChangeEmailState>(
          listener: (context, state) {
            if (state is ChangeEmailSuccess) {
              Navigator.pop(context);
              showOtpBottomSheet();
            }
            if (state is ChangeEmailFailure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.error0,
                  content: Text(
                    state.error.toString(),
                    style: TextStyle(color: AppColors.neutral100),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ChangeEmailLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }
            return ChangeEmailModal(
              title: 'Change Email',
              subTitle:
                  'Please enter your email address accurately to stay up to date.',
              inputTitle: 'New Email',
              controller: newEmailController,
              onPress: () {
                context.read<ChangeEmailBloc>().add(
                  ChangeEmailRequestEvent(
                    token: args['token'],
                    email: newEmailController.text,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  showOtpBottomSheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BlocConsumer<ResetEmailBloc, ResetEmailState>(
          listener: (context, state) {
            if (state is ResetEmailSuccess) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.success0,
                  content: Text(
                    state.message.toString(),
                    style: TextStyle(color: AppColors.neutral100),
                  ),
                ),
              );
            }
            if (state is ResetEmailFailure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.error0,
                  content: Text(
                    state.error.toString(),
                    style: TextStyle(color: AppColors.neutral100),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ResetEmailLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }
            return OtpModal(
              email: newEmailController.text,
              onPress: (otpCode) {
                context.read<ResetEmailBloc>().add(
                  ResetEmailRequestEvent(
                    newEmailController.text,
                    args['token'],
                    currentPasswordController.text,
                    int.parse(otpCode),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  openChangePasswordModal() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.success0,
                  content: Text(
                    state.message,
                    style: TextStyle(color: AppColors.neutral100),
                  ),
                ),
              );
            } else if (state is ChangePasswordFailure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.error0,
                  content: Text(
                    state.error.toString(),
                    style: TextStyle(color: AppColors.neutral100),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ChangePasswordLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }

            return ChangePasswordModal(
              title: 'Change Password',
              subTitle: 'Set a new password (minimum 6 characters).',
              currentPasswordTitle: 'Current Password',
              newPasswordTitle: 'New Password',
              reEnterPasswordTitle: 'Re-Enter New Password',
              currentPasswordController: changeCurrentPasswordController,
              newPasswordController: changeNewPasswordController,
              reEnterPasswordController: changeReEnterPasswordController,
              onPress: () {
                context.read<ChangePasswordBloc>().add(
                  ChangePasswordRequestEvent(
                    token: args['token'],
                    currentPassword: changeCurrentPasswordController.text,
                    newPassword: changeNewPasswordController.text,
                    confirmPassword: changeReEnterPasswordController.text,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
