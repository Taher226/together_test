import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/core/staticData/data.dart';

class CampaignsSection extends StatelessWidget {
  const CampaignsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Campaigns',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.neutral10,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 410,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: campaigns.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.83,
                  margin: EdgeInsets.all(10),

                  decoration: BoxDecoration(
                    color: AppColors.neutral100,
                    border: Border.all(color: AppColors.neutral90, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      Image.asset('${campaigns[i]['logo']}', fit: BoxFit.cover),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              margin: EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                child: Image.asset('images/handsLogo.png'),
                              ),
                            ),
                            Text(
                              'By Hands For Charity',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.neutral70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              campaigns[i]['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.neutral10,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'As winter intensifies in Lebanon, Yemen, and Sudan, countless refugees are in desperate need of help.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.neutral30,
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  elevation: 0,
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Create Campaign',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.neutral100,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  elevation: 0,
                                  backgroundColor: AppColors.neutral100,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: AppColors.primary,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'More Details',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
