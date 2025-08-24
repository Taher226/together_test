import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';

class FaqSection extends StatefulWidget {
  final String title;
  final String content;
  final bool isExpanded;
  const FaqSection({
    super.key,
    required this.title,
    required this.content,
    required this.isExpanded,
  });

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.neutral100,
          borderRadius: BorderRadius.circular(8),
        ),

        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child:
            isExpanded == true
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.neutral10,
                          ),
                        ),
                        Icon(
                          Icons.expand_less,
                          size: 24,
                          color: AppColors.neutral10,
                        ),
                      ],
                    ),

                    SizedBox(height: 15),
                    Text(
                      widget.content,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.neutral10,
                      ),
                    ),
                  ],
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutral10,
                      ),
                    ),
                    Icon(
                      Icons.expand_more,
                      size: 24,
                      color: AppColors.neutral10,
                    ),
                  ],
                ),
      ),
    );
  }
}
