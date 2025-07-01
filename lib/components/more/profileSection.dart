import 'package:flutter/material.dart';
import 'package:together_test/constants/colors.dart';

class ProfileSection extends StatefulWidget {
  final bool isEditMode;
  final String firstLabel;
  final String firstHint;
  final TextEditingController firstController;
  final Widget? firstSuffix;
  final Widget? firstSuffixIcon;
  final bool? isPasswordText;
  final bool? hasSecondInput;
  final String? secondLabel;
  final String? secondHint;
  final TextEditingController? secondController;
  const ProfileSection({
    super.key,
    required this.isEditMode,
    required this.firstLabel,
    required this.firstHint,
    required this.firstController,
    this.firstSuffix,
    this.firstSuffixIcon,
    this.isPasswordText,
    this.hasSecondInput,
    this.secondLabel,
    this.secondHint,
    this.secondController,
  });

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.neutral100,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Text(
                    widget.firstLabel,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.neutral30,
                    ),
                  ),
                ),
                TextFormField(
                  controller: widget.firstController,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  obscureText: widget.isPasswordText ?? false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: widget.firstSuffixIcon,
                    suffix: widget.firstSuffix,
                    enabled: widget.isEditMode,
                    filled: !widget.isEditMode,
                    fillColor: AppColors.disabled,
                    hintText: widget.firstHint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.placeholder),
                    ),
                  ),
                ),
              ],
            ),
          ),
          widget.hasSecondInput == true
              ? Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Text(
                        widget.secondLabel ?? '',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.neutral30,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: widget.secondController,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        enabled: widget.isEditMode,
                        filled: !widget.isEditMode,
                        fillColor: AppColors.disabled,
                        hintText: widget.secondHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.placeholder),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
