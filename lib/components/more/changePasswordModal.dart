import 'package:flutter/material.dart';
import 'package:together_test/constants/colors.dart';

class ChangePasswordModal extends StatefulWidget {
  final String title;
  final String subTitle;
  final String currentPasswordTitle;
  final String newPasswordTitle;
  final String reEnterPasswordTitle;

  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController reEnterPasswordController;

  final VoidCallback onPress;

  const ChangePasswordModal({
    super.key,
    required this.title,
    required this.subTitle,
    required this.currentPasswordTitle,
    required this.newPasswordTitle,
    required this.reEnterPasswordTitle,
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.reEnterPasswordController,

    required this.onPress,
  });

  @override
  State<ChangePasswordModal> createState() => _ChangePasswordModalState();
}

class _ChangePasswordModalState extends State<ChangePasswordModal> {
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.neutral10,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.subTitle,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.neutral20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Text(
                        widget.currentPasswordTitle,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.neutral30,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: widget.currentPasswordController,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },

                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.error0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.placeholder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                      cursorColor: AppColors.primary,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Text(
                        widget.newPasswordTitle,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.neutral30,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: widget.newPasswordController,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.error0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.placeholder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                      cursorColor: AppColors.primary,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Text(
                        widget.reEnterPasswordTitle,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.neutral30,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: widget.reEnterPasswordController,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      onChanged: (value) {
                        if (widget.currentPasswordController.text.length >= 8 &&
                            widget.newPasswordController.text.length >= 8 &&
                            widget.reEnterPasswordController.text.length >= 8) {
                          setState(() {
                            isTrue = true;
                          });
                        } else {
                          setState(() {
                            isTrue = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.error0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.placeholder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                      cursorColor: AppColors.primary,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: isTrue == false ? null : widget.onPress,
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: AppColors.neutral80,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: AppColors.primary,
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.neutral100,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
