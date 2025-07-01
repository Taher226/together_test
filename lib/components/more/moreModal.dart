import 'package:flutter/material.dart';
import 'package:together_test/constants/colors.dart';

class MoreModal extends StatelessWidget {
  final String icon;
  final String title;
  final String redText;
  final String blueText;
  const MoreModal({
    super.key,
    required this.icon,
    required this.title,
    required this.redText,
    required this.blueText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            child: Divider(thickness: 3, color: Color(0xFFABB7C2)),
          ),
          SizedBox(height: 10),
          Image.asset(icon, width: 141, height: 139),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.neutral10,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 48,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: AppColors.error0, width: 1),
                ),
                backgroundColor: AppColors.neutral100,
              ),
              child: Text(
                redText,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.error0,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 48,
            margin: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: AppColors.primary,
              ),
              child: Text(
                blueText,
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
    );
  }
}
