import 'package:flutter/material.dart';
import 'package:together_test/constants/colors.dart';

class TermsSection extends StatelessWidget {
  final String title;
  final String description;
  const TermsSection({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.neutral10,
          ),
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.neutral20,
          ),
        ),
      ],
    );
  }
}
