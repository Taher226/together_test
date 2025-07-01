import 'package:flutter/material.dart';
import 'package:together_test/constants/colors.dart';

class ScreenLayout extends StatelessWidget {
  final List<Widget> children;
  final bool? centerAlignment;
  const ScreenLayout({super.key, required this.children, this.centerAlignment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Column(
                  crossAxisAlignment:
                      centerAlignment == true
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                  children: [...children],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
