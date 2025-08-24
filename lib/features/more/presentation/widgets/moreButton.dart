import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';

class MoreButton extends StatefulWidget {
  final String title;
  final String icon;
  final VoidCallback onPress;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool? hasDivider;
  final Color? titleColor;
  final bool? hasArrow;
  const MoreButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.padding,
    this.margin,
    this.hasDivider,
    this.titleColor,
    this.hasArrow = true,
  });

  @override
  State<MoreButton> createState() => _MoreButtonState();
}

class _MoreButtonState extends State<MoreButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onPress,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.neutral100,
            ),
            padding: widget.padding,
            margin: widget.margin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(widget.icon, width: 24, height: 24),
                    SizedBox(width: 20),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: widget.titleColor ?? AppColors.neutral10,
                      ),
                    ),
                  ],
                ),
                widget.hasArrow == true
                    ? Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: AppColors.neutral70,
                    )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
        widget.hasDivider == true ? SizedBox(height: 10) : SizedBox.shrink(),
        widget.hasDivider == true
            ? Divider(color: AppColors.neutral90)
            : SizedBox.shrink(),
        widget.hasDivider == true ? SizedBox(height: 10) : SizedBox.shrink(),
      ],
    );
  }
}
