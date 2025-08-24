import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';

class SubscriptionSection extends StatefulWidget {
  final String title;
  final String type;
  final String? donationPlan;
  final String nextPayment;
  final String paymentGateway;
  final String paymentAmount;
  final String subscriptionID;
  final VoidCallback onPress;
  const SubscriptionSection({
    super.key,
    required this.title,
    required this.type,
    required this.donationPlan,
    required this.nextPayment,
    required this.paymentGateway,
    required this.paymentAmount,
    required this.subscriptionID,
    required this.onPress,
  });

  @override
  State<SubscriptionSection> createState() => _SubscriptionSectionState();
}

class _SubscriptionSectionState extends State<SubscriptionSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            padding: EdgeInsets.only(top: 16, left: 8, right: 8),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.neutral100,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.type,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.neutral100,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Column(
              children: [
                widget.donationPlan != null
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Donation Plan',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.neutral10,
                          ),
                        ),
                        Text(
                          widget.donationPlan!,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.neutral10,
                          ),
                        ),
                      ],
                    )
                    : SizedBox.shrink(),
                widget.donationPlan != null
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
                      'Next payment',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.neutral10,
                      ),
                    ),
                    Text(
                      widget.nextPayment,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutral10,
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
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.neutral10,
                      ),
                    ),
                    Text(
                      widget.paymentGateway,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutral10,
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.neutral90, thickness: 1, height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment Amount',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.neutral10,
                      ),
                    ),
                    Text(
                      widget.paymentAmount,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutral10,
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.neutral90, thickness: 1, height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subscription ID',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.neutral10,
                      ),
                    ),
                    Text(
                      widget.subscriptionID,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutral10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: widget.onPress,
                    child: Text(
                      'Cancel Subscription',
                      style: TextStyle(
                        color: AppColors.error0,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.error90,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      side: BorderSide(color: AppColors.error0, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
