import 'package:flutter/material.dart';
import 'package:together_test/constants/colors.dart';

class Newslettercard extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final VoidCallback onPressed;
  const Newslettercard({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 20),
      color: AppColors.neutral100,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Join our newsletter',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.neutral10,
            ),
          ),
          Text(
            'Get access to our events and news, and more from\nhands for charity',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.neutral20,
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: nameController,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                hintText: 'Your Name',
                hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.neutral80,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 10,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.neutral70, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Your Email',
                hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.neutral80,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 10,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.neutral70, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Join',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.neutral100,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
