import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/features/more/data/repositories/show_profile_repository_impl.dart';
import 'package:together_test/features/more/domain/usecases/show_profile_usecase.dart';
import 'package:together_test/features/more/presentation/bloc/logout/log_out_bloc.dart';
import 'package:together_test/features/more/presentation/bloc/showProfile/show_profile_bloc.dart';
import 'package:together_test/features/more/presentation/widgets/moreButton.dart';
import 'package:together_test/features/more/presentation/widgets/moreModal.dart';

class More extends StatelessWidget {
  const More({super.key});
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as Map;
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};

    openLogoutModal() {
      return showModalBottomSheet(
        context: context,
        builder: (context) {
          return MoreModal(
            title: 'Your’e Leaving.. Are you Sure ?',
            icon: 'images/logoutPopUpIcon.png',
            redText: 'Yes, log me out',
            blueText: 'No, keep me logged in',
            onPress: () {
              context.read<LogoutBloc>().add(LogOutRequestEvent(args['token']));
            },
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
            onPress: () {
              print(args['token']);
            },
          );
        },
      );
    }

    bool loggedIn = true;

    return BlocProvider(
      create:
          (_) =>
              ShowProfileBloc(ShowProfileUseCase(ShowProfileRepositoryImpl()))
                ..add(ShowProfileRequestEvent(args['token'])),

      child: Scaffold(
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
                          ? BlocBuilder<ShowProfileBloc, ShowProfileState>(
                            builder: (context, state) {
                              if (state is ShowProfileLoading) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                                );
                              } else if (state is ShowProfileFailure) {
                                return Center(
                                  child: Text(
                                    state.error,
                                    style: TextStyle(color: AppColors.error0),
                                  ),
                                );
                              } else if (state is ShowProfileSuccess) {
                                final data = state.profile;
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.neutral100,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        backgroundImage:
                                            data.photoUrl != null &&
                                                    data.photoUrl!.isNotEmpty
                                                ? NetworkImage(
                                                  data.photoUrl.toString(),
                                                )
                                                : null,
                                        child:
                                            data.photoUrl == null ||
                                                    data.photoUrl!.isEmpty
                                                ? Icon(
                                                  Icons.person,
                                                  color: Colors.black,
                                                )
                                                : null,
                                      ),
                                      SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${data.firstName} ${data.lastName}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.neutral10,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                              vertical: 3,
                                            ),
                                            child: Text(
                                              data.email ?? '',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.neutral20,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primary,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pushNamed(
                                                'profile',
                                                arguments: {
                                                  'firstName': data.firstName,
                                                  'lastName': data.lastName,
                                                  'email': data.email,
                                                  'id': data.id,
                                                  'phone': data.phone,
                                                  'address': data.address,
                                                  'city': data.city,
                                                  'countryCode':
                                                      data.countryCode,
                                                  'countryId': data.countryId,
                                                  'isSocial': data.isSocial,
                                                  'photoInfo': data.photoInfo,
                                                  'photoUrl': data.photoUrl,
                                                  'postalCode': data.postalCode,
                                                  'stateId': data.stateId,
                                                  'token': args['token'],
                                                },
                                              );
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
                                );
                              }
                              return SizedBox.shrink();
                            },
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
                              onPress: () {},
                              hasDivider: true,
                            ),

                            MoreButton(
                              title: 'Zakat Calculator',
                              icon: 'images/zakatCalculatorMore.png',
                              onPress: () {},
                              hasDivider: true,
                            ),
                            MoreButton(
                              title: 'Qibla Compass',
                              icon: 'images/qiblaCompassMore.png',
                              onPress: () {},
                              hasDivider: true,
                            ),
                            MoreButton(
                              title: 'Prayer Times',
                              icon: 'images/prayerTimesMore.png',
                              onPress: () {},
                              hasDivider: true,
                            ),
                            MoreButton(
                              title: 'Dhikr Counter',
                              icon: 'images/dhikrCounterMore.png',
                              onPress: () {},
                              hasDivider: true,
                            ),
                            MoreButton(
                              title: 'Blog',
                              icon: 'images/blogMore.png',
                              onPress: () {},
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
                              onPress: () {},
                              hasDivider: true,
                            ),
                            MoreButton(
                              title: 'My Campaigns',
                              icon: 'images/myCampaignsMore.png',
                              onPress: () {},
                              hasDivider: true,
                            ),
                            MoreButton(
                              title: 'Subscriptions',
                              icon: 'images/subscriptionsMore.png',
                              onPress: () {
                                Navigator.of(
                                  context,
                                ).pushNamed('subscriptions');
                              },
                              hasDivider: true,
                            ),
                            MoreButton(
                              title: 'Transactions History',
                              icon: 'images/transactionsHistoryMore.png',
                              onPress: () {
                                Navigator.of(
                                  context,
                                ).pushNamed('transactionHistory');
                              },
                              hasDivider: true,
                            ),
                            MoreButton(
                              title: 'Language',
                              icon: 'images/languageMore.png',
                              onPress: () {},
                              hasDivider: true,
                            ),
                            MoreButton(
                              title: 'About us',
                              icon: 'images/aboutUsMore.png',
                              onPress: () {
                                Navigator.of(context).pushNamed('aboutUs');
                              },
                              hasDivider: true,
                            ),
                            MoreButton(
                              title: 'FAQ',
                              icon: 'images/faqMore.png',
                              onPress: () {
                                Navigator.of(context).pushNamed('faq');
                              },
                              hasDivider: true,
                            ),
                            MoreButton(
                              title: 'Privacy Policy',
                              icon: 'images/privacyPolicyMore.png',
                              onPress: () {
                                Navigator.of(
                                  context,
                                ).pushNamed('privacyPolicy');
                              },
                              hasDivider: true,
                            ),
                            MoreButton(
                              title: 'Terms & Conditions',
                              icon: 'images/termsMore.png',
                              onPress: () {
                                Navigator.of(
                                  context,
                                ).pushNamed('termsAndConditions');
                              },
                              hasDivider: true,
                            ),
                            MoreButton(
                              title: 'Contact us',
                              icon: 'images/contactUsMore.png',
                              onPress: () {},
                              hasDivider: true,
                            ),
                            BlocConsumer<LogoutBloc, LogoutState>(
                              listener: (context, state) {
                                if (state is LogoutSuccess) {
                                  Navigator.of(
                                    context,
                                  ).pushReplacementNamed('emailLogin');
                                } else if (state is LogoutFailure) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        " Failed to logout: ${state.error}",
                                      ),
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state is LogoutLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return MoreButton(
                                  title: 'Log out',
                                  icon: 'images/logoutMore.png',
                                  onPress: () {
                                    openLogoutModal();
                                  },
                                  hasDivider: true,
                                  hasArrow: false,
                                );
                              },
                            ),
                            MoreButton(
                              title: 'Delete Account',
                              icon: 'images/deleteAccountMore.png',
                              onPress: () {
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
      ),
    );
  }
}
