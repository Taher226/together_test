import 'package:flutter/material.dart';
import 'package:together_test/core/widgets/otpBox.dart';
import 'package:together_test/core/config/theme/colors.dart';

class OtpModal extends StatefulWidget {
  final void Function(String otpCode) onPress;
  final String email;
  const OtpModal({super.key, required this.onPress, required this.email});

  @override
  State<OtpModal> createState() => _OtpModalState();
}

class _OtpModalState extends State<OtpModal> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  String getOtpCode() {
    return controller1.text +
        controller2.text +
        controller3.text +
        controller4.text;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('images/otpModalIcon.png', width: 62, height: 62),
              SizedBox(height: 10),
              Text(
                'Verify its you',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'We sent verfication code to\n',
                      style: TextStyle(
                        color: AppColors.neutral20,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: widget.email,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' please check\nyour inbox and enter the code below',
                      style: TextStyle(
                        color: AppColors.neutral20,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Change Email",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  otpBox(controller1, focusNode1, focusNode2),
                  SizedBox(width: 10),
                  otpBox(controller2, focusNode2, focusNode3),
                  SizedBox(width: 10),
                  otpBox(controller3, focusNode3, focusNode4),
                  SizedBox(width: 10),
                  otpBox(controller4, focusNode4, null),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/timerIcon.png', width: 24, height: 24),
                  SizedBox(width: 5),
                  Text(
                    "5:50",
                    style: TextStyle(
                      color: AppColors.neutral40,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    final otpCode = getOtpCode();
                    debugPrint("OTP ENTERED: $otpCode"); //
                    widget.onPress(otpCode);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Verify Code',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.neutral100,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn’t receive a code ?",
                    style: TextStyle(
                      color: AppColors.neutral40,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Resend code again",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
