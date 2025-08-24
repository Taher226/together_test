import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.neutral100,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'New Charity Events From Our Organization',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.neutral10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            child: Column(
              children: [
                Image.asset(
                  'images/eventHome.png',
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 40,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: AppColors.neutral100,
                      size: 20,
                    ),
                    iconAlignment: IconAlignment.end,
                    label: Text(
                      'Explore Events',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutral100,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
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
