import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/features/more/presentation/widgets/moreButton.dart';
import 'package:together_test/features/more/presentation/widgets/moreModal.dart';

class More extends StatelessWidget {
  const More({super.key});
  @override
  Widget build(BuildContext context) {
    openLogoutModal() {
      return showModalBottomSheet(
        context: context,
        builder: (context) {
          return MoreModal(
            title: 'Your’e Leaving.. Are you Sure ?',
            icon: 'images/logoutPopUpIcon.png',
            redText: 'Yes, log me out',
            blueText: 'No, keep me logged in',
          );
        },
      );
    }

    openDeleteAccountModal() {
      return showModalBottomSheet(
        context: context,
        builder: (context) {
          return MoreModal(
            title: 'Your’e Leaving.. Are you Sure ?',
            icon: 'images/deleteAccountPopUpIcon.png',
            redText: 'Yes, delete my account',
            blueText: 'No, it was by mistake',
          );
        },
      );
    }

    bool loggedIn = true;
    var name = 'Taher Mohamed';
    var email = 'tahermohamed@gmail.com';
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xFFF4FCFF),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.neutral10,
                        ),
                      ),
                    ),
                    loggedIn == true
                        ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.neutral100,
                          ),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.person, color: Colors.black),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.neutral10,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    child: Text(
                                      email,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.neutral20,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(
                                        context,
                                      ).pushNamed('profile');
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 16,
                                      color: AppColors.neutral100,
                                    ),
                                    label: Text(
                                      'Profile',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.neutral100,
                                      ),
                                    ),
                                    iconAlignment: IconAlignment.end,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                        : MoreButton(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 12,
                          ),
                          margin: EdgeInsets.only(top: 10),
                          title: 'Login / Sign up',
                          icon: 'images/loginMore.png',
                          onPress: () {
                            Navigator.of(context).pushNamed('emailLogin');
                          },
                        ),

                    SizedBox(height: 20),
                    Text(
                      'Services',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.neutral10,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.neutral100,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          MoreButton(
                            title: 'Quick Donations',
                            icon: 'images/quickDonationMore.png',
                            onPress: () {
                              print('Quick Donations');
                            },
                            hasDivider: true,
                          ),

                          MoreButton(
                            title: 'Zakat Calculator',
                            icon: 'images/zakatCalculatorMore.png',
                            onPress: () {
                              print('Zakat Calculator');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'Qibla Compass',
                            icon: 'images/qiblaCompassMore.png',
                            onPress: () {
                              print('Qibla Compass');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'Prayer Times',
                            icon: 'images/prayerTimesMore.png',
                            onPress: () {
                              print('Prayer Times');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'Dhikr Counter',
                            icon: 'images/dhikrCounterMore.png',
                            onPress: () {
                              print('Dhikr Counter');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'Blog',
                            icon: 'images/blogMore.png',
                            onPress: () {
                              print('Blog');
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.neutral10,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.neutral100,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        children: [
                          MoreButton(
                            title: 'Notification',
                            icon: 'images/notificationMore.png',
                            onPress: () {
                              print('Notification');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'My Campaigns',
                            icon: 'images/myCampaignsMore.png',
                            onPress: () {
                              print('My Campaigns');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'Subscriptions',
                            icon: 'images/subscriptionsMore.png',
                            onPress: () {
                              print('Subscriptions');
                              Navigator.of(context).pushNamed('subscriptions');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'Transactions History',
                            icon: 'images/transactionsHistoryMore.png',
                            onPress: () {
                              print('Transactions History');
                              Navigator.of(
                                context,
                              ).pushNamed('transactionHistory');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'Language',
                            icon: 'images/languageMore.png',
                            onPress: () {
                              print('Language');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'About us',
                            icon: 'images/aboutUsMore.png',
                            onPress: () {
                              print('About us');
                              Navigator.of(context).pushNamed('aboutUs');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'FAQ',
                            icon: 'images/faqMore.png',
                            onPress: () {
                              print('FAQ');
                              Navigator.of(context).pushNamed('faq');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'Privacy Policy',
                            icon: 'images/privacyPolicyMore.png',
                            onPress: () {
                              print('Privacy Policy');
                              Navigator.of(context).pushNamed('privacyPolicy');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'Terms & Conditions',
                            icon: 'images/termsMore.png',
                            onPress: () {
                              print('Terms & Conditions');
                              Navigator.of(
                                context,
                              ).pushNamed('termsAndConditions');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'Contact us',
                            icon: 'images/contactUsMore.png',
                            onPress: () {
                              print('Contact us');
                            },
                            hasDivider: true,
                          ),
                          MoreButton(
                            title: 'Log out',
                            icon: 'images/logoutMore.png',
                            onPress: () {
                              print('Log out');
                              openLogoutModal();
                            },
                            hasDivider: true,
                            hasArrow: false,
                          ),
                          MoreButton(
                            title: 'Delete Account',
                            icon: 'images/deleteAccountMore.png',
                            onPress: () {
                              print('Delete Account');
                              openDeleteAccountModal();
                            },
                            titleColor: AppColors.error0,
                            hasArrow: false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
