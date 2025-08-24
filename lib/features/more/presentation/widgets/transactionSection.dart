import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';

class TransactionSection extends StatefulWidget {
  final bool isSelected;
  final String title;
  final String type;
  final String amount;
  final String? plan;
  final String paymentType;
  final String gateway;
  final String id;
  final String date;

  const TransactionSection({
    super.key,
    required this.isSelected,
    required this.title,
    required this.type,
    required this.amount,
    required this.plan,
    required this.paymentType,
    required this.gateway,
    required this.id,
    required this.date,
  });

  @override
  State<TransactionSection> createState() => _TransactionSectionState();
}

class _TransactionSectionState extends State<TransactionSection> {
  late bool isSelected;
  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.neutral90, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                    print('ssss${widget.isSelected}');
                  });
                },
                child:
                    isSelected == true
                        ? Icon(Icons.check_box, color: AppColors.primary)
                        : Icon(
                          Icons.check_box_outline_blank,
                          color: AppColors.primary,
                        ),
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.neutral10,
                        ),
                      ),
                      Text(
                        widget.type,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.neutral30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: AppColors.neutral90,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.amount,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.neutral10,
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            decoration: BoxDecoration(color: AppColors.neutral100),
            child: Column(
              children: [
                widget.plan != null
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Donation Plan',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.neutral20,
                          ),
                        ),
                        Text(
                          widget.plan!,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppColors.neutral20,
                          ),
                        ),
                      ],
                    )
                    : SizedBox.shrink(),
                widget.plan != null
                    ? Divider(
                      color: AppColors.neutral90,
                      thickness: 1,
                      height: 20,
                    )
                    : SizedBox.shrink(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment Type',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.neutral20,
                      ),
                    ),
                    Text(
                      widget.paymentType,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.neutral20,
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.neutral90, thickness: 1, height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment Gateway',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.neutral20,
                      ),
                    ),
                    Text(
                      widget.gateway,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.neutral20,
                      ),
                    ),
                  ],
                ),

                Divider(color: AppColors.neutral90, thickness: 1, height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction ID',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.neutral20,
                      ),
                    ),
                    Text(
                      widget.id,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.neutral20,
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.neutral90, thickness: 1, height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction Date',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.neutral20,
                      ),
                    ),
                    Text(
                      widget.date,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.neutral20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
