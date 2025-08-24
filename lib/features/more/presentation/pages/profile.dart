import 'package:flutter/material.dart';
import 'package:together_test/core/widgets/otpModal.dart';
import 'package:together_test/core/config/theme/colors.dart';
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

  TextEditingController firstNameController = TextEditingController(
    text: 'Taher',
  );
  TextEditingController lastNameController = TextEditingController(
    text: 'Medan',
  );
  TextEditingController addressController = TextEditingController(
    text: 'Street1, Ontario, Canada',
  );
  TextEditingController emailController = TextEditingController(
    text: 'yassinmustafa10@gmail.com',
  );
  TextEditingController phoneNumberController = TextEditingController(
    text: '012012012012',
  );
  TextEditingController passwordController = TextEditingController(
    text: 'sssssssssssssss',
  );
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

  openEnterPasswordModal() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return ChangeEmailModal(
          title: 'Enter your password',
          subTitle: 'Please enter your current password to proceed',
          inputTitle: 'Current Password',
          controller: currentPasswordController,
          onPress: () {
            Navigator.pop(context);
            openChangeEmailModal();
            currentPasswordController.clear();
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
        return ChangeEmailModal(
          title: 'Change Email',
          subTitle:
              'Please enter your email address accurately to stay up to date.',
          inputTitle: 'New Email',
          controller: newEmailController,
          onPress: () {
            Navigator.pop(context);
            showOtpBottomSheet();
            newEmailController.clear();
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
        return OtpModal(
          onPress: () {
            Navigator.of(context).pop();
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
            Navigator.pop(context);
          },
        );
      },
    );
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
      body: Container(
        width: double.infinity,
        color: Color(0xFFF4FCFF),
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.neutral100,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 56,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 10),
                    isEditMode == true
                        ? InkWell(
                          onTap: () {
                            print('Change photo');
                          },
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
                                    print('change');
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
                                    isPasswordChecked = !isPasswordChecked;
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
                              width: MediaQuery.of(context).size.width * 0.55,
                              height: 48,

                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    openSaveChangesModal(context);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
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
                              width: MediaQuery.of(context).size.width * 0.3,
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
                                    borderRadius: BorderRadius.circular(8),
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
      ),
    );
  }
}
